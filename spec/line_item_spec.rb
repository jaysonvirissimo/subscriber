RSpec.describe Subscriber::LineItem do
  describe "#import_duty" do
    subject { described_class.new(1, type, 10.00) }

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
    subject { described_class.new(1, type, 14.99) }

    context "when not exempt" do
      let(:type) { "music CD" }

      specify { expect(subject.sales_tax).to eq(1.50) }
    end

    context "when exempt" do
      let(:type) { "headache pills" }

      specify { expect(subject.sales_tax).to be_zero }
    end
  end

  describe "to_s" do
    subject { Subscriber.parse("2 book at 12.49").first }

    specify do
      expect(subject.to_s).to eq("2 book: 24.98")
    end
  end
end
