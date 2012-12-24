class V1::StatsController < V1::ApiBaseController
  def index
    case params[:stats_type].downcase
      when 'daily'
        render json: Statistics::Daily.new(params).stats()
      when 'hourly'
        render json: Statistics::Hourly.new(params).stats()
      else
        render json: {status: 0}
    end
  end
end
