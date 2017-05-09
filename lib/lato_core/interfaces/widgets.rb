module LatoCore

  # This module contains a list of functions used by controllers to interact with widgets
  # cells.
  module Interface::Widgets

    # This function manage the widget index from front end.
    def core__widgets_index records, search: nil, pagination: 50
      response = {
        records: records,
        total: records.length,
        per_page: pagination,
        search: '',
        pagination: 1,
      }
      # manage search
      if search && params[:widget_index] && params[:widget_index][:search]
        response[:records] = records.where("#{search} like ?", "%#{params[:widget_index][:search]}%")
        response[:total] = records.length
        response[:search] = params[:widget_index][:search]
      end
      # manage pagination
      if pagination && params[:widget_index] && params[:widget_index][:pagination]
        response[:pagination] = params[:widget_index][:pagination]
      end
      # return response
      return response
    end

  end
end