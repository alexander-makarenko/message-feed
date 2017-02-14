OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :google_oauth2,
           ENV['google_client_id'],
           ENV['google_client_secret'],
           prompt: 'select_account',
           image_aspect_ratio: 'square'

  provider :github,
           ENV['github_client_id'],
           ENV['github_client_secret'],
           scope: 'user'

  provider :facebook,
           ENV['facebook_app_id'],
           ENV['facebook_app_secret'],
           scope: 'email',
           display: 'page',
           image_size: 'square'
end