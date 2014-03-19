module JsonListMiddleware
  class Rails < Rails::Railtie
    initializer "json_list_middleware.configure_rails_initialization" do |app|
      app.middleware.insert_before ActionDispatch::ParamsParser, "JsonListMiddleware::Middleware"
    end
  end
end