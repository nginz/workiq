Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Workiq::Middleware::Client
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Workiq::Middleware::Server
  end
end