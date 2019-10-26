# frozen_string_literal: true

require 'timecop'

module TimeCopHelper
  def freeze_date(year, month, day)
    let(:current_date) do
      Time.zone.now.change(year: year, month: month, day: day)
    end

    around do |example|
      Timecop.freeze(current_date, &example)
    end
  end
end

RSpec.configure do |config|
  config.extend TimeCopHelper
end
