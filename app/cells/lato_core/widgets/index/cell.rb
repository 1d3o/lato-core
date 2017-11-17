# TODO: Write the component in a better way.

module LatoCore

  class Widgets::Index::Cell < Cell

    @@requested_args = [:records]

    @@default_args = {
      head: [],
      columns: [],
      index_url: nil,
      pagination: false,
      search: false,
      actions: {
        show: false,
        edit: false,
        delete: false,
        new: false
      },
      table: {
        fixed: false,
        height: nil
      },
      table_body: {
        hover: false
      }
    }

    def initialize(args = {})
      @args = validate_args(
        args: args,
        requested_args: @@requested_args,
        default_args: @@default_args
      )

      set_conditions
    end

    def show
      render 'show.html'
    end

    private

      def set_conditions
        @records = @args[:records].is_a?(Hash) ? @args[:records][:records] : @args[:records]
        @total = @args[:records].is_a?(Hash) ? @args[:records][:total] : @args[:records].length
        # conditions for show
        @show_row_actions = @args[:index_url] && @args[:actions] && (@args[:actions][:show] || @args[:actions][:edit] || @args[:actions][:delete])
        @show_row_actions_class = @show_row_actions ? 'widgets-index--actions' : ''
        @show_search = @args[:index_url] && @args[:search]
        @show_pagiantion = @args[:index_url] && @args[:pagination]
        @show_new_action = @args[:index_url] && @args[:actions] && @args[:actions][:new]
        # generate table components
        @table = generate_table
        @table_head = generate_table_head
        @table_body = generate_table_body
        @table_rows = generate_table_rows
        # generate search components
        @search_form = generate_search_form if @show_search
        @search_input = generate_search_input if @show_search
        @search_submit = generate_search_submit if @show_search
        @search_params = generate_search_params if @show_search
        # generate action components
        @action_new_button = generate_new_button if @show_new_action
        # generate pagination components
        @pagination = generate_pagination if @show_pagiantion
      end

      # Table generation:

      # This function generate the table.
      def generate_table
        return LatoCore::Elements::Table::Container::Cell.new(
          fixed: @args[:table][:fixed],
          height: @args[:table][:height]
        )
      end

      # This function generate the head for the table.
      def generate_table_head
        labels = []

        if @args[:head] && @args[:head].length > 0
          # manage case with custom head
          labels = @args[:head]
          labels.push(LANGUAGES[:lato_core][:mixed][:actions]) if @show_row_actions
        elsif @records && @records.length > 0
          # manage case without custom head
          labels = @records.first.attributes.keys.map {|s| s.gsub('_', ' ')}
          labels = labels.map(&:capitalize)
          labels.push(LANGUAGES[:lato_core][:mixed][:actions]) if @show_row_actions
        end

        return LatoCore::Elements::Table::Head::Cell.new(labels: labels)
      end

      # This function generate the table body.
      def generate_table_body
        return LatoCore::Elements::Table::Body::Cell.new(
          hover: @args[:table_body][:hover]
        )
      end

      # This function generate the rows fr the table.
      def generate_table_rows
        table_rows = []

        if @args[:columns] && @args[:columns].length > 0
          # manage case with custom columns
          table_rows = generate_table_rows_from_columns_functions(@args[:columns])
        elsif @records && @records.length > 0
          # manage case without custom columns
          table_rows = generate_table_rows_from_columns_functions(@records.first.attributes.keys)
        end

        return table_rows
      end

      # This function generate the rows for a list of columns.
      def generate_table_rows_from_columns_functions columns_functions
        table_rows = []

        @records.each do |record|
          labels = []
          # add function result to row columns
          columns_functions.each do |column_function|
            labels.push(record.send(column_function))
          end
          # add actions to row columns
          if @show_row_actions
            labels.push(generate_actions_bottongroup_for_record(record))
          end
          # puts rows on table rows
          table_rows.push(LatoCore::Elements::Table::Row::Cell.new(labels: labels))
        end

        return table_rows
      end

      # This function generate row actions for a table row.
      def generate_actions_bottongroup_for_record record
        action_buttons = []
        action_buttons.push(generate_show_button(record.id)) if @args[:actions][:show]
        action_buttons.push(generate_edit_button(record.id)) if @args[:actions][:edit]
        action_buttons.push(generate_delete_button(record.id)) if @args[:actions][:delete]
        return LatoCore::Elements::Buttongroup::Cell.new(buttons: action_buttons)
      end

      # Actions generation:

      # This function generate the show button for a record.
      def generate_show_button record_id
        return unless @args[:index_url]
        url = @args[:index_url].end_with?('/') ? "#{@args[:index_url].gsub(/\?.*/, '')}#{record_id}" : "#{@args[:index_url].gsub(/\?.*/, '')}/#{record_id}"
        return LatoCore::Elements::Button::Cell.new(label: LANGUAGES[:lato_core][:mixed][:show], url: url, style: 'info', icon: 'eye')
      end

      # This function generate the edit button for a record.
      def generate_edit_button record_id
        return unless @args[:index_url]
        url = @args[:index_url].end_with?('/') ? "#{@args[:index_url].gsub(/\?.*/, '')}#{record_id}/edit" : "#{@args[:index_url].gsub(/\?.*/, '')}/#{record_id}/edit"
        return LatoCore::Elements::Button::Cell.new(label: LANGUAGES[:lato_core][:mixed][:edit], url: url, style: 'warning', icon: 'pencil')
      end

      # This function generate the delete button for a record.
      def generate_delete_button record_id
        return unless @args[:index_url]
        url = @args[:index_url].end_with?('/') ? "#{@args[:index_url].gsub(/\?.*/, '')}#{record_id}" : "#{@args[:index_url].gsub(/\?.*/, '')}/#{record_id}"
        return LatoCore::Elements::Button::Cell.new(label: LANGUAGES[:lato_core][:mixed][:delete], url: url, method: 'delete',
        icon: 'trash', style: 'danger', confirmation: {
          message: LANGUAGES[:lato_core][:mixed][:default_delete_message],
          positive_response: LANGUAGES[:lato_core][:mixed][:default_delete_positive_response],
          negative_response: LANGUAGES[:lato_core][:mixed][:default_delete_negative_response]
        })
      end

      # This function generate new button.
      def generate_new_button
        return unless @args[:index_url]
        url = "#{@args[:index_url].gsub(/\?.*/, '')}/new"
        return LatoCore::Elements::Button::Cell.new(label: LANGUAGES[:lato_core][:mixed][:new],
        url: url, icon: 'plus')
      end

      # Search generation:

      # This function generate a form for the index.
      def generate_search_form
        return unless @args[:index_url]
        return LatoCore::Inputs::Form::Cell.new(url: @args[:index_url], method: 'get')
      end 

      # This function generate and return the search input.
      def generate_search_input
        search_placeholder = @args[:records].is_a?(Hash) ? @args[:records][:search_key].humanize : ''
        search_value = @args[:records].is_a?(Hash) ? @args[:records][:search] : ''
        return LatoCore::Inputs::Text::Cell.new(name: 'widget_index[search]', value: search_value, placeholder: search_placeholder)
      end

      # This function generate the search submit button.
      def generate_search_submit
        return LatoCore::Elements::Button::Cell.new(label: ' ', icon: 'search', type: 'submit', icon_align: 'right')
      end

      # This function generate a list of params the need to be set on the search form.
      def generate_search_params
        return Rack::Utils.parse_query URI(@args[:index_url]).query
      end

      # Pagination generation:

      def generate_pagination
        total_records = @args[:records].is_a?(Hash) ? @args[:records][:total] : @args[:records].length
        total_records_per_page = @args[:records].is_a?(Hash) ? @args[:records][:per_page] : @args[:records].length
        total_pages = (total_records.to_f / total_records_per_page.to_f).ceil
        current_page = @args[:records].is_a?(Hash) ? @args[:records][:pagination] : 1
        search_value = @args[:records].is_a?(Hash) ? @args[:records][:search] : ''

        url = core__add_param_to_url(@args[:index_url], 'widget_index[search]', search_value)
        return LatoCore::Elements::Pagination::Cell.new(total: total_pages, current: current_page, url: url,
        param: 'widget_index[pagination]')
      end

  end

end