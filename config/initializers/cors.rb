# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # dev origin(s)
    origins 'http://localhost:5173', 'http://127.0.0.1:5173', 'https://pharma-website-fe.onrender.com'

    resource '/api/*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false

    # Allow ActiveStorage direct blob/variant requests (if using rails_blob_url)
    resource '/rails/active_storage/*',
      headers: :any,
      methods: [:get, :options],
      credentials: false
  end

  # If you want to allow any origin (not recommended for production), use:
  # allow do
  #   origins '*'
  #   resource '*', headers: :any, methods: :any
  # end
end
