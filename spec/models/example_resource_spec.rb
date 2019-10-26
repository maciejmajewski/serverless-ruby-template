# frozen_string_literal: true

RSpec.describe ExampleResource do
  describe '.create' do
    before do
      described_class.create(attributes)
    end

    let(:attributes) do
      {
        name: 'Hello World'
      }
    end

    it 'creates an object' do
      expect(described_class.all)
        .to contain_exactly(have_attributes(attributes))
    end
  end
end
