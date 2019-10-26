# frozen_string_literal: true

Dynamoid.configure do |config|
  config.endpoint = 'http://localhost:8000'
end

module DynamoidReset
  def self.all
    Dynamoid.adapter.list_tables.each do |table|
      Dynamoid.adapter.delete_table(table)
    end

    Dynamoid.adapter.tables.clear

    Dynamoid.included_models.each { |m| m.create_table(sync: true) }
  end
end

RSpec.configure do |config|
  config.before(:each) do
    DynamoidReset.all
  end
end
