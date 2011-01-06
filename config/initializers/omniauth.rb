require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  tmp_dir = File.join(Rails.root, 'tmp')

  provider :github, ENV['GITHUB_CONSUMER_KEY'], ENV['GITHUB_CONSUMER_SECRET']
  provider :open_id, OpenID::Store::Filesystem.new(tmp_dir)
  provider :open_id, OpenID::Store::Filesystem.new(tmp_dir), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
