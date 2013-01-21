class V1::StatsController < V1::ApiBaseController

  def index
    render :nothing => true, status: :ok
  end

  def stats
    render json: Statistics.stats(params, @user), status: :ok
  end

  def except_auth_params
    %w(stats_type id)
  end

end
