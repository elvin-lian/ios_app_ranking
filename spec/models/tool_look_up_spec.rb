# encoding: utf-8
require 'spec_helper'

describe ToolLookUp do

  describe ':fetch_by_url' do

    it 'should return rss feed of all genres result as json' do
      url = 'https://itunes.apple.com/CN/rss/topfreeapplications/limit=10/json'
      res = ToolLookUp.fetch_by_url(url)
      res.is_a?(Hash).should eq true
      res['feed']['id']['label'].should eq url
      res['feed']['updated']['label'].should_not be_nil
      res['feed']['entry'].size.should eq 10
    end

    it 'should return rss feed of game genre result as json' do
      url = 'https://itunes.apple.com/CN/rss/topfreeapplications/limit=10/genre=6014/json'
      res = ToolLookUp.fetch_by_url(url)
      res.is_a?(Hash).should eq true
      res['feed']['id']['label'].should eq url
      res['feed']['updated']['label'].should_not be_nil
      res['feed']['entry'].size.should eq 10
    end

  end

  describe ':format_feed_result' do

    it 'should return JSON from all genre' do
      str = File.read(File.dirname(__FILE__) + '/../fixtures/rss_feed_result_all')
      @feed_result = JSON.parse(str)

      got = ToolLookUp.format_feed_result(@feed_result)
      got.is_a?(Hash).should be true
      got[:updated].should eq '2012-12-20 05:36:32'
      got[:added_at].should eq Time.now.utc.beginning_of_hour.to_formatted_s(:db)
      got[:apps].size.should eq 10
      got[:apps].first.should eq ({
          artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
          currency: 'CNY',
          price: 0.0,
          primary_genre_id: '6014',
          track_id: '468575024',
          track_name: '天朝教育委员会',
          track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2'
      })
    end

    it 'should return JSON from game genre' do
      str = File.read(File.dirname(__FILE__) + '/../fixtures/rss_feed_result_6014')
      @feed_result = JSON.parse(str)

      got = ToolLookUp.format_feed_result(@feed_result)
      got.is_a?(Hash).should be true
      got[:updated].should eq '2012-12-20 07:14:56'
      got[:added_at].should eq Time.now.utc.beginning_of_hour.to_formatted_s(:db)
      got[:apps].size.should eq 10
      got[:apps].first.should eq ({
          artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
          currency: 'CNY',
          price: 0.0,
          primary_genre_id: '6014',
          track_id: '468575024',
          track_name: '天朝教育委员会',
          track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2'
      })
    end
  end

  describe ':save' do
    before do
      @feed = RssFeed.create(country: 'cn', feed_type: 'topfreeappsapplications', feed_genre: '6014', url: 'http://example.com')

      @data = {
          updated: '2012-12-20 07:00:00',
          added_at: Time.now.utc.beginning_of_hour.to_formatted_s(:db),
          apps: [{
                     artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
                     currency: 'CNY',
                     price: 0.0,
                     primary_genre_id: '6014',
                     track_id: '468575024',
                     track_name: '天朝教育委员会',
                     track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2',
                     feed_type: 'topfreeapps',
                     feed_country: 'cn',
                     feed_genre: '6014'
                 }]
      }
    end

    context 'when table not exist' do
      without_transactional_fixtures do
        it 'should create a new table' do

          ActiveRecord::Base.connection.execute("truncate ios_apps")

          ToolLookUp.send(:save, @feed.rank_table_name, @data)

          ios_app = IosApp.find_by_track_id('468575024')
          ios_app.feed_type.should eq 'topfreeapps'
          ios_app.feed_country.should eq 'cn'
          ios_app.feed_genre.should eq '6014'

          table_name = "rank_#{Time.now.year}_cn_topfreeapps_6014"
          RankBase.table_name = table_name
          RankBase.count.should eq 1

          sql = "drop table if exists #{table_name}"
          ActiveRecord::Base.connection.execute(sql)
        end
      end
    end
  end


  describe ':add_feed_info_to_apps' do
    before do
      @feed = RssFeed.create(country: 'cn', feed_type: 'topfreeappsapplications', feed_genre: '6014', url: 'http://example.com')

      @data = {
          updated: '2012-12-20 07:00:00',
          added_at: Time.now.utc.beginning_of_hour.to_formatted_s(:db),
          apps: [{
                     artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
                     currency: 'CNY',
                     price: 0.0,
                     primary_genre_id: '6014',
                     track_id: '468575024',
                     track_name: '天朝教育委员会',
                     track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2'
                 }]
      }
    end

    it 'should add rss feed info to ios app' do
      got = ToolLookUp.send(:add_feed_info_to_apps, @feed, @data)
      got.should eq ({
          updated: '2012-12-20 07:00:00',
          added_at: Time.now.utc.beginning_of_hour.to_formatted_s(:db),
          apps: [{
                     artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
                     currency: 'CNY',
                     price: 0.0,
                     primary_genre_id: '6014',
                     track_id: '468575024',
                     track_name: '天朝教育委员会',
                     track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2',
                     feed_type: 'topfreeapps',
                     feed_country: 'cn',
                     feed_genre: '6014'
                 }]
      })
    end
  end


  describe 'run', working: true do
    before do
      str = File.read(File.dirname(__FILE__) + '/../fixtures/rss_feed_result_6009')
      ToolLookUp.stub(:fetch_by_url).and_return(JSON.parse(str.to_s))

      url = 'https://itunes.apple.com/CN/rss/topfreeapplications/limit=300/genre=6009/json'
      @feed = RssFeed.create(:country => 'CN', :feed_genre => 6009, :feed_type => 'topfreeapplication', :url => url)
    end

    it 'should create 300 ranking' do
      RankBase.table_name = @feed.rank_table_name
      RankBase.destroy_all

      ToolLookUp.send :run, 'CN', 'topfreeapplication', 6009, 0

      res = 0
      RankBase.group('rank').count.each { |k, count| res = res + count.to_i }
      res.should eq 300
    end
  end
end