# frozen_string_literal: true

require_handler :example_handler

RSpec.describe :example_handler do
  it 'returns config' do
    expect(JSON.parse(example_handler[:body]))
      .to include('config_from_repo' => 'Hello World')
  end
end
