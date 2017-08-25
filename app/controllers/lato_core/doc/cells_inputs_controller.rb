module LatoCore
  class Doc::CellsInputsController < Doc::DocController

    def form; end

    def text; end

    def number; end

    def password; end

    def email; end

    def select; end

    def textarea; end

    def datetime; end

    def date; end

    def checkbox; end

    def editor; end

    def dropzone; end

    def dropzone_exec; end

    def geolocalization; end

    def sortableblock; end

    def youtube; end

    def multipleselect; end

    def multipleselect_categories
      render json: [
        {label: 'Animals', value: 'cat1'},
        {label: 'Colors', value: 'cat2'},
        {label: 'Cities', value: 'cat3'}
      ]
    end

    def multipleselect_values
      possibilities = {
        cat1: [
          {label: 'Cat', value: 1},
          {label: 'Dog', value: 2}
        ],
        cat2: [
          {label: 'Yellow', value: 3},
          {label: 'Blue', value: 4}
        ],
        cat3: [
          {label: 'Rome', value: 5},
          {label: 'Venice', value: 6}
        ]
      }
      render json: possibilities[params[:value].to_sym]
    end

  end
end
