module LatoCore

  # This module contains a list of functions used to authenticate a superuser.
  module Interface::Authentication

    # This function set a cookie to create the superuser session.
    def core__create_superuser_session superuser, lifetime
      token = core__encode_token(lifetime, superuser_id: superuser.id)
      session[:lato_core__superuser_session_token] = token
    end

    # This function delete a cookie to destroy the superuser session.
    def core___destroy_superuser_session
      session[:lato_core__superuser_session_token] = nil
    end

    # This function tells if the current session is valid.
    def core__check_superuser_session_valid
      decoded_token = core__decode_token(session[:lato_core__superuser_session_token])
      return false unless decoded_token
      true
    end

    # This function check the session for a superuser and set the variable @core__current_superuser.
    # If session is not valid the user should be redirect to login path.
    def core__manage_superuser_session
      decoded_token = core__decode_token(session[:lato_core__superuser_session_token])

      if decoded_token
        @core__current_superuser = LatoCore::Superuser.find_by(id: decoded_token[:superuser_id])
        unless @core__current_superuser
          core___destroy_superuser_session
          redirect_to lato_core.login_path
        end
      else
        redirect_to lato_core.login_path
      end
    end

  end
end