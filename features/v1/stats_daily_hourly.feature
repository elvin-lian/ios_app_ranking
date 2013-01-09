Feature: 时间和日期报表

  Background: prepare data
    Given there is a user
    And there is a app with following data
      | track_id | primary_genre_id |
      | 1001     | 6014             |

  Scenario: Fetch stats successfully
    When I send a GET api request to "/v1/stats/daily_hourly/#{@ios_app_1001.track_id}" with following data
      | country | lang  | app_genre | app_key          |
      | cn      | zh_cn | 0, 6014   | #{@user.app_key} |
    Then I should receive the JSON response data
    """
    {
      "status": 1,
      "hourly_stats": {},
      "daily_stats": {}
    }
    """