LatoCore::Engine.routes.draw do

  # load custom routes files
  def draw(routes_name)
    instance_eval(File.read(LatoCore::Engine.root.join("config/routes/#{routes_name}.rb")))
  end

  # set root path
  root 'application#index'

  # import routes
  draw :api
  draw :back
  draw :doc

end
