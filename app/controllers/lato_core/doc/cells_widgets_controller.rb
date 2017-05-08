module LatoCore
  class Doc::CellsWidgetsController < Doc::DocController

    def index
      @superusers = LatoCore::Superuser.all
    end

  end
end