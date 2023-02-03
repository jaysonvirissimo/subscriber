RSpec.describe Subscriber::LineItem do
  describe "import_duty" do
    subject do
      described_class.new(1, type, 10.00)
    end

    context "when imported" do
      let(:type) { "imported box of chocolates" }

      specify { expect(subject.import_duty).to eq(0.50) }
    end

    context "when not imported" do
      let(:type) { "foo bars" }

      specify { expect(subject.import_duty).to be_zero }
    end
  end

  describe "#sales_tax" do
    subject do
      described_class.new(1, "music CD", 14.99)
    end

    specify { expect(subject.sales_tax).to eq(1.50) }
  end
end
