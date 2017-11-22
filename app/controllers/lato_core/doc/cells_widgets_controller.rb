module LatoCore
  class Doc::CellsWidgetsController < Doc::DocController

    def index
      @superusers = LatoCore::Superuser.all
      @widget_index_superusers = core__widgets_index(@superusers, search: 'surname', pagination: 10)
    end

    def index_v2
      @superusers = LatoCore::Superuser.all
    end

  end
end
