module ItunesApp
  module ApiRequirement
    def api_authenticate(params, controller_name)
      if params
        controller_name = controller_name.singularize
        params_tmp = params
        params_tmp.delete(controller_name)
        s = params_tmp.delete('s')
        params_tmp['tkey'] = Rails.application.config.api_requirement_secret
        res = ''
        Hash[params_tmp.sort].each_value { |v| res += v.to_s }
        s = s.downcase if !s.nil?

        Rails.logger.debug("===== s: #{Digest::SHA1.hexdigest(res)}")
        Digest::SHA1.hexdigest(res).eql?(s)
      else
        false
      end
    end
  end
end