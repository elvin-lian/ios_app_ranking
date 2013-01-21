class V1::ApiBaseController < ActionController::Base

  include ItunesApp::ApiRequirement

  respond_to :json

  before_filter :set_locale
  before_filter :validate_user, :authenticate_request

  def authenticate_request
    except_params = except_auth_params + [controller_name.singularize, 'controller', 'action']
    unless api_authenticate(params, @user.app_secret, except_params)
      render :json => {:status => 0, :message => I18n::t('api.mess.authorization_failed')}, :status => :forbidden
    end
  end

  def validate_user(app_key = nil)
    app_key = params[:app_key] if app_key.nil?
    if app_key.blank?
      render json: {status: 0, message: I18n::t('api.mess.invalidate_request')}, status: :forbidden
    else
      unless (@user = User.find_by_app_key(app_key))
        render json: {status: 0, message: I18n::t('api.mess.authorization_failed')}, status: :not_found
      end
    end
  end

  def except_auth_params
    []
  end

  def default_url_options(options = {})
    options.merge({:locale => I18n.locale})
  end

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end

end