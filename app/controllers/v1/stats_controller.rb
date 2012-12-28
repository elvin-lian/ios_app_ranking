class V1::StatsController < V1::ApiBaseController
  before_filter

  def index
    case params[:stats_type].downcase
      when 'daily'
        render json: Statistics::Daily.new(params).stats
      when 'hourly'
        render json: Statistics::Hourly.new(params).stats
      when 'daily_hourly'
        render json: Statistics::DailyHourly.new(params).stats
      else
        render json: {status: 0}
    end
  end

  def except_auth_params
    %w(stats_type track_id)
  end
end
