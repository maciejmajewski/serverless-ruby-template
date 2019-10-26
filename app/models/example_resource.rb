# frozen_string_literal: true

class ExampleResource
  include Dynamoid::Document

  table name: ENV['DYNAMODB_TABLE_EXAMPLE'], key: :resource_id

  field :name, :string
end
