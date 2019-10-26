# frozen_string_literal: true

Dynamoid.configure do |config|
  config.namespace = ''
  config.application_timezone = 'Europe/Berlin'
end

Dynamoid.logger.level = Logger::FATAL
