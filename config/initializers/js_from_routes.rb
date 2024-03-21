if defined? JsFromRoutes
  JsFromRoutes.config do |config|
    config.output_folder = Rails.root.join('app', 'javascript', 'src', 'api')
    config.client_library = '@js-from-routes/axios'
  end
end
