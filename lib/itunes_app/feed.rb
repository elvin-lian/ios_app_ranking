module ItunesApp
  class Feed
    class << self

      def countries
        {
            'China' => 'CN',
            'United States' => 'US'
        }
      end

      def feed_type
        {
            'Top Free Apps' => 'topfreeapplications',
            'Top Paid Apps' => 'toppaidapplications'
        }
      end

      def genres
        {
            'All Genres' => '',
            'Books' => '6018',
            'Business' => '6000',
            'Catalogs' => '6022',
            'Education' => '6017',
            'Entertainment' => '6016',
            'Finance' => '6015',
            'Food &amp; Drink' => '6023',
            'Games' => '6014',
            'Health &amp; Fitness' => '6013',
            'Lifestyle' => '6012',
            'Medical' => '6020',
            'Music' => '6011',
            'Navigation' => '6010',
            'News' => '6009',
            'Newsstand' => '6021',
            'Photo &amp; Video' => '6008',
            'Productivity' => '6007',
            'Reference' => '6006',
            'Social Networking' => '6005',
            'Sports' => '6004',
            'Travel' => '6003',
            'Utilities' => '6002',
            'Weather' => '6001'
        }
      end


    end
  end
end
