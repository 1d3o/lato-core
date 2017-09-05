module LatoCore

  # This module contains a list of functions used to manage tokens.
  # All functions on the module depends on 'jwt' gem.
  module Interface::Token

    # This functon return a token with encrypted payload information.
    def core__encode_token exp, payload
      exp = 1.day.from_now unless exp
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end

    # This function return the payload of a token.
    def core__decode_token token
      begin
        body = JWT.decode(token, Rails.application.secrets.secret_key_base,
                          true, algorithm: 'HS256')[0]
        return HashWithIndifferentAccess.new body
      rescue => exception
        return nil
      end
    end

  end
end
