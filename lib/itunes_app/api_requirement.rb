module ItunesApp
  module ApiRequirement
    def api_authenticate params, app_secret, except_auth_params = []
      if params
        params_tmp = params.clone

        except_auth_params.each do |k|
          params_tmp.delete(k)
        end

        s = params_tmp.delete('s')

        s = s.downcase unless s.nil?

        res = (params_tmp.sort.collect { |c| "#{c[0]}#{c[1]}" }).join('')
        res = app_secret + res + app_secret

        #Rails.logger.debug("=====  params: #{params_tmp}")
        #Rails.logger.debug("=====   s: #{s}")
        #Rails.logger.debug("===== res: #{Digest::SHA1.hexdigest(res)}")

        Digest::SHA1.hexdigest(res).eql?(s)
      else
        false
      end
    end
  end
end