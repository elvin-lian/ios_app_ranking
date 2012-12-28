module ItunesApp
  class Tool
    class << self

      def encrypt_id id
        str = id.to_s
        res = (str.first.to_i * 7).to_s.last + id.to_s + (str.last.to_i * 3).to_s.last
        res.to_i.to_s(16)
      end

      def decrypt_id string
        return nil if string.blank?
        res = string.to_s.hex.to_s
        uid = res[1..-2]
        if (uid.first.to_i * 7).to_s.last == res.first and (uid.last.to_i * 3).to_s.last == res.last
          uid.to_i
        else
          nil
        end
      end

      def generate_key size = 32
        Base64.encode64(OpenSSL::Random.random_bytes(size)).gsub(/\W/, '')
      end

      def random_str length = 4
        SecureRandom.hex(length)
      end

    end
  end
end