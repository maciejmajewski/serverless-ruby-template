# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'active_support/all'
require 'json'

require 'dotenv'
Dotenv.load('.env', '.env.local')

require_relative 'config/initializers/timezone'
require_relative 'config/initializers/dynamodb'

require_relative 'models/example_resource'

def render(status_code: 200, json:)
  {
    statusCode: status_code,
    body: JSON.generate(json),
    headers: { 'Access-Control-Allow-Origin' => '*' }
  }
end

def require_handler(name)
  require_relative File.expand_path("../app/handlers/#{name}", __dir__)
end
