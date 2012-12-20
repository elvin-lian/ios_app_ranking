# encoding: utf-8
require 'spec_helper'

describe RankBase do

  describe ':fly_create' do
    without_transactional_fixtures do
      it 'should add a new record' do
        table = 'rank_test_tmp'
        drop_table(table)
        RankBase.fly_create table, {ios_app_id: 1, rank: 1, added_at: '2012-12-20 12:00:00'}
        RankBase.where(ios_app_id: 1).should_not be_nil

        table = 'rank_test_tmp2'
        drop_table(table)
        RankBase.fly_create table, {ios_app_id: 2, rank: 1, added_at: '2012-12-20 12:00:00'}
        RankBase.where(ios_app_id: 1).should eq []
        RankBase.where(ios_app_id: 2).should_not be_nil
      end
    end
  end

  describe ':create_table!' do
    without_transactional_fixtures do
      context '当表不存时' do
        before do
          @table_name = "rank_2012_top_free_6014"
          drop_table(@table_name)
        end

        it '应用创建表' do
          ActiveRecord::Base.connection.table_exists?(@table_name).should eq false
          RankBase.create_table!(@table_name)
          ActiveRecord::Base.connection.table_exists?(@table_name).should eq true
        end
      end
    end
  end

  describe ':format_table_name' do
    it 'should format table name' do
      expect = "rank_#{Time.now.year}_cn_topfree_6014"
      RankBase.format_table_name('cn', 'topfreeapplications', '6014').should eq expect
    end
  end

  def drop_table table_name
    sql = "drop table if exists #{table_name}"
    ActiveRecord::Base.connection.execute(sql)
  end

end
