module LatoCore
  class Back::SuperusersController < Back::BackController

    before_action do
      core__set_menu_active_item('core_superusers')
      check_superuser_permissions
    end

    def index
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:superusers])
      @superusers = LatoCore::Superuser.all
      @widget_index_superusers = core__widgets_index(@superusers, search: 'surname', pagination: 10)
    end

    def show
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:superusers_show])
      @superuser = LatoCore::Superuser.find_by(id: params[:id])

      if !@superuser
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_found]
        redirect_to lato_core.superusers_path
        return
      end
    end

    def new
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:superusers_new])
      @superuser = LatoCore::Superuser.new
      fetch_external_objects
    end

    def create
      @superuser = LatoCore::Superuser.new(superuser_params)

      if !@superuser.save
        flash[:danger] = @superuser.errors.full_messages.to_sentence
        redirect_to lato_core.new_superuser_path
        return
      end
      
      flash[:success] = LANGUAGES[:lato_core][:flashes][:superuser_create_success]
      redirect_to lato_core.superuser_path(@superuser.id)
    end
    
    def edit
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:superusers_edit])
      @superuser = LatoCore::Superuser.find_by(id: params[:id])

      if !@superuser
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_found]
        redirect_to lato_core.superusers_path
        return
      end

      if @superuser.permission >= @core__current_superuser.permission && @superuser.id != @core__current_superuser.id
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_permission]
        redirect_to lato_core.superusers_path
        return
      end

      fetch_external_objects
    end
    
    def update
      @superuser = LatoCore::Superuser.find_by(id: params[:id])

      if !@superuser
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_found]
        redirect_to lato_core.superusers_path
        return
      end

      if @superuser.permission >= @core__current_superuser.permission && @superuser.id != @core__current_superuser.id
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_permission]
        redirect_to lato_core.superusers_path
        return
      end

      if !@superuser.update(superuser_params)
        flash[:danger] = @superuser.errors.full_messages.to_sentence
        redirect_to lato_core.edit_superuser_path(@superuser.id)
        return
      end
      
      flash[:success] = LANGUAGES[:lato_core][:flashes][:superuser_update_success]
      redirect_to lato_core.superuser_path(@superuser.id)
    end
    
    def destroy
      @superuser = LatoCore::Superuser.find_by(id: params[:id])

      if !@superuser
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_found]
        redirect_to lato_core.superusers_path
        return
      end

      if @superuser.permission >= @core__current_superuser.permission && @superuser.id != @core__current_superuser.id
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_permission]
        redirect_to lato_core.superusers_path
        return
      end

      if !@superuser.destroy
        flash[:danger] = @superuser.errors.full_messages.to_sentence
        redirect_to lato_core.superusers_path
        return
      end

      flash[:success] = LANGUAGES[:lato_core][:flashes][:superuser_destroy_success]
      redirect_to lato_core.superusers_path
    end

    private

    def superuser_params
      params.require(:superuser).permit(:name, :surname, :email, :username, :password,
      :password_confirmation, :permission, :biography)
    end

    def fetch_external_objects
      @permissions_list = get_permissions_list_for_current_superuser
    end

    def get_permissions_list_for_current_superuser
      return CONFIGS[:lato_core][:superusers_permissions].values.select {
        |x| x[:value] <= @core__current_superuser.permission
      }
    end

    def check_superuser_permissions
      min = CONFIGS[:lato_core][:superusers_management_permissions][:min]
      max = CONFIGS[:lato_core][:superusers_management_permissions][:max]
      if @core__current_superuser.permission < min || @core__current_superuser.permission > max
        flash[:warning] = LANGUAGES[:lato_core][:flashes][:superuser_not_permission]
        redirect_to root_path
      end
    end

  end
end
