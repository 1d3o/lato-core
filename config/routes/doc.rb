namespace :doc do

  root 'doc#index'

  # cells elements
  get 'cells_elements_row', to: 'cells_elements#row', as: 'cells_elements_row'
  get 'cells_elements_block', to: 'cells_elements#block', as: 'cells_elements_block'
  get 'cells_elements_button', to: 'cells_elements#button', as: 'cells_elements_button'
  get 'cells_elements_buttongroup', to: 'cells_elements#buttongroup', as: 'cells_elements_buttongroup'
  get 'cells_elements_flash', to: 'cells_elements#flash_messages', as: 'cells_elements_flash'
  get 'cells_elements_icon', to: 'cells_elements#icon', as: 'cells_elements_icon'
  get 'cells_elements_title', to: 'cells_elements#title', as: 'cells_elements_title'
  get 'cells_elements_table', to: 'cells_elements#table', as: 'cells_elements_table'
  get 'cells_elements_table_head', to: 'cells_elements#table_head', as: 'cells_elements_table_head'
  get 'cells_elements_table_body', to: 'cells_elements#table_body', as: 'cells_elements_table_body'
  get 'cells_elements_table_row', to: 'cells_elements#table_row', as: 'cells_elements_table_row'
  get 'cells_elements_pagination', to: 'cells_elements#pagination', as: 'cells_elements_pagination'

  # cells inputs
  get 'cells_inputs_form', to: 'cells_inputs#form', as: 'cells_inputs_form'
  get 'cells_inputs_text', to: 'cells_inputs#text', as: 'cells_inputs_text'
  get 'cells_inputs_password', to: 'cells_inputs#password', as: 'cells_inputs_password'
  get 'cells_inputs_email', to: 'cells_inputs#email', as: 'cells_inputs_email'
  get 'cells_inputs_select', to: 'cells_inputs#select', as: 'cells_inputs_select'
  get 'cells_inputs_textarea', to: 'cells_inputs#textarea', as: 'cells_inputs_textarea'

  # cells widgets
  get 'cells_widgets_index', to: 'cells_widgets#index', as: 'cells_widgets_index'

end