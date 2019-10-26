# frozen_string_literal: true

require_relative '../boot'

def example_handler(**)
  render json: {
    config_from_repo: ENV['EXAMPLE_CONFIG'],
    ruby_version: RUBY_VERSION
  }
end
