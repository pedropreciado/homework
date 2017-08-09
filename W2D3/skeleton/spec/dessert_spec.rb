require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:donut) { Dessert.new("donut", 4, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(donut.type).to eq("donut")
    end
    it "sets a quantity" do
      expect(donut.quantity).to eq(4)
    end

    it "starts ingredients as an empty array" do
      expect(donut.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { donut.quantity("4") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      donut.add_ingredient("saturated fat")
      expect( donut.ingredients ).to include( "saturated fat" )
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      donut.add_ingredient("flour")
      donut.add_ingredient("water")
      donut.add_ingredient("sugar")
      donut.add_ingredient("love")
      expect(donut.ingredients).not_to eq(donut.ingredients)
      donut.mix!
      expect(donut.ingredients).not_to eq(donut.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      donut.eat(2)
      expect(donut.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {donut.eat(5)}.to raise_error(StandardError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleized).and_return("Chef Tucker the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(donut)
      donut.make_more
    end
  end
end
