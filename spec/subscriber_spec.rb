# frozen_string_literal: true

RSpec.describe Subscriber do
  it "has a version number" do
    expect(Subscriber::VERSION).not_to be nil
  end

  describe ".parse" do
    subject do
      described_class.parse("2 book at 12.49\n1 music CD at 14.99")
    end

    specify { expect(subject.count).to eq(2) }
    specify do
      subject.each do |line_item|
        expect(line_item).to respond_to(:quantity)
        expect(line_item).to respond_to(:type)
        expect(line_item).to respond_to(:price)
      end
    end
  end
end
