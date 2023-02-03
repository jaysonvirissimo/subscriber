RSpec.describe Subscriber::LineItem do
  describe "#sales_tax" do
    subject do
      described_class.new(1, "music CD", 14.99)
    end

    specify { expect(subject.sales_tax).to eq(1.50) }
  end
end
