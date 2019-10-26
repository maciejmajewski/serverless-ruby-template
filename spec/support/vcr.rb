# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { record: :new_episodes } unless ENV['CI']
  config.configure_rspec_metadata!
  config.ignore_localhost = true

  # %w[SENSITIVE_ENV_VARIABLE].each do |env_variable|
  #   config.filter_sensitive_data(env_variable) do
  #     ENV[env_variable] || env_variable
  #   end
  # end
end
