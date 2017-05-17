module LatoCore
  module Back

    # AuthenticationController
    class AuthenticationController < Back::BackController

      layout 'lato_core/authentication'

      skip_before_action :core__manage_superuser_session

      def index; end

      def exec_login
        @superuser = LatoCore::Superuser.find_by(username: params[:username])
        return unless check_superuser_exist

        # check superuser is authenticated
        unless @superuser.authenticate(params[:password])
          flash[:danger] = LANGUAGES[:lato_core][:flashes][:uncorrect_password]
          redirect_to lato_core.login_path
          return
        end

        # save user login on database and create session
        superuser.save_login(request.remote_ip)
        core__create_superuser_session(@superuser, 1.days.from_now)
        redirect_to lato_core.dashboard_path
      end

      def exec_logout
        core___destroy_superuser_session
        flash[:success] = LANGUAGES[:lato_core][:flashes][:logout_success]
        redirect_to lato_core.login_path
      end

      private

        def check_superuser_exist
          unless @superuser
            flash[:danger] = LANGUAGES[:lato_core][:flashes][:user_not_found]
            redirect_to lato_core.login_path
            return false
          end
        end

    end
  end
end
