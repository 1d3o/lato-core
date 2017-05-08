module LatoCore
  module CellsHelper
    
    def cell(*names)
      # return correct cell
      cell_class = "LatoCore::"
      names.each do |name|
        cell_class = "#{cell_class}#{name.capitalize}::"
      end
      cell_class = "#{cell_class}Cell".constantize
      return cell_class
    end
    
  end
end