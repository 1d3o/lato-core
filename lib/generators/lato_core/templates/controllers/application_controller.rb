class Lato::ApplicationController < ApplicationController

  layout 'lato_core/admin'

  before_action :core__cells_initialize
  before_action :core__manage_superuser_session

  def index
    core__set_menu_active_item('sample_page')
    core__set_header_active_page_title('Sample page')
  end

end
