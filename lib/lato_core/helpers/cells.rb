module LatoCore

  # This module contains helpers used to manage cells.
  module Helper::Cells

    # This helper is used to create a new cell with a pretty format.
    def cell(*names)
      # define variables
      names_list = names.first.to_s.start_with?('lato_') ? names[1..-1] : names
      cell_class = names.first.to_s.start_with?('lato_') ? "#{names.first.classify}::" : 'LatoCore::'
      # return correct cell
      names_list.each do |name|
        cell_class = "#{cell_class}#{name.capitalize}::"
      end
      "#{cell_class}Cell".constantize
    end

  end

end