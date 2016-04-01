OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['779471148852872'], ENV['b970b7a2a3262a6294e71f77f5bde08b']
end