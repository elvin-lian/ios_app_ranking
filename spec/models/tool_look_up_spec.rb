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
      got[:updated_at].should eq '2012-12-20 05:00:00'
      got[:apps].size.should eq 10
      got[:apps].first.should eq ({
          artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
          currency: 'CNY',
          description: '【爱Apps末日狂欢给力特约】- 超火爆游戏“天朝教育委员会”',
          price: '0.00000',
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
      got[:updated_at].should eq '2012-12-20 07:00:00'
      got[:apps].size.should eq 10
      got[:apps].first.should eq ({
          artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
          currency: 'CNY',
          description: '调整了部分界面,增加了新的制作成员。',
          price: '0.00000',
          primary_genre_id: '6014',
          track_id: '468575024',
          track_name: '天朝教育委员会',
          track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2'
      })
    end
  end

  describe ':save', working: true do
    before do
      @feed = RssFeed.create(country: 'cn', feed_type: 'free_app', feed_genre: '6014', url: 'http://example.com')

      @data = {
          updated_at: '2012-12-20 07:00:00',
          apps: [{
                     artwork_url_100: 'http://a1303.phobos.apple.com/us/r1000/060/Purple/v4/e6/88/97/e6889717-8301-7eff-e08a-0989ac3e1234/mzl.ysodlegv.100x100-75.png',
                     currency: 'CNY',
                     description: '调整了部分界面,增加了新的制作成员。',
                     price: '0.00000',
                     primary_genre_id: '6014',
                     track_id: '468575024',
                     track_name: '天朝教育委员会',
                     track_view_url: 'https://itunes.apple.com/cn/app/tian-chao-jiao-yu-wei-yuan-hui/id468575024?mt=8&uo=2'
                 }]
      }
    end

    context 'when table not exist' do
      without_transactional_fixtures do
        it 'should create a new table', working: true do

          ActiveRecord::Base.connection.execute("truncate ios_apps")

          ToolLookUp.save(@feed, @data)

          table_name = "rank_#{Time.now.year}_cn_free_app_6014"
          RankBase.table_name = table_name
          RankBase.count.should eq 1

          sql = "drop table if exists #{table_name}"
          ActiveRecord::Base.connection.execute(sql)
        end
      end
    end
  end

end