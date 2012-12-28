module ItunesApp
  class Des
    class << self

      def encrypt(string, key)
        if string.blank? or key.blank?
          nil
        else
          cipher_text = des(:encrypt, string, key)
          Base64.strict_encode64(cipher_text)
        end
      end

      def decrypt(encrypt_string, key)
        return nil if encrypt_string.blank? or key.blank?
        decrypt_string = nil
        begin
          encrypt_string = Base64.strict_decode64(encrypt_string)
          decrypt_string = des(:decrypt, encrypt_string, key)
        rescue => error
          Rails.logger.info(error)
        end
        decrypt_string
      end

      private

      def des(method, string, key)
        cipher = OpenSSL::Cipher::Cipher.new("des")
        cipher.send(method)
        cipher.key = key
        cipher_text = cipher.update(string)
        cipher_text << cipher.final
      end
    end
  end
end