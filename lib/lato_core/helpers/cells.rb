module LatoCore

  # This module contains helpers used to manage cells.
  module Helper::Cells

    # This helper is used to create a new cell with a pretty format.
    def cell(*names)
      # return correct cell
      cell_class = 'LatoCore::'
      names.each do |name|
        cell_class = "#{cell_class}#{name.capitalize}::"
      end
      "#{cell_class}Cell".constantize
    end

  end

end