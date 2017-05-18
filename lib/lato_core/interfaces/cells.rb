module LatoCore

  # This module contains a list of functions used by controllers to interact with widgets
  # cells.
  module Interface::Cells

    # This function must be executed before every action and set metadata
    # used by cells.
    def core__cells_initialize
      @core__authenticity_token = form_authenticity_token
    end

    # This function manage the widget index from front end.
    def core__widgets_index(records, search: nil, pagination: 50)
      response = {
        records: records,
        total: records.length,
        per_page: pagination,
        search: '',
        pagination: 1,
      }
      # manage search
      if search && params[:widget_index] && params[:widget_index][:search]
        response[:records] = response[:records].where("#{search} like ?", "%#{params[:widget_index][:search]}%")
        response[:total] = response[:records].length
        response[:search] = params[:widget_index][:search]
      end
      # manage pagination
      if pagination
        if params[:widget_index] && params[:widget_index][:pagination]
          response[:pagination] = params[:widget_index][:pagination].to_i
        end
        response[:records] = core__paginate_array(response[:records], pagination, response[:pagination])
      end
      # return response
      response
    end

  end
end