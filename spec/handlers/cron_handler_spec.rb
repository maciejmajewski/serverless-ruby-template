# frozen_string_literal: true

require_handler :cron_handler

RSpec.describe :cron_handler do
  it 'returns something' do
    expect(cron_handler).to eq('I am cron')
  end
end
