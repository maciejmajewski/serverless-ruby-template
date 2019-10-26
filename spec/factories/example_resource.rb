# frozen_string_literal: true

FactoryBot.define do
  factory :example_resource do
    sequence(:name) { |n| "Dummy #{n}" }
  end
end
