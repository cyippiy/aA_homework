require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cake) { Dessert.new("cake",1,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(1)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
     expect { double("cake","a",chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      cake.add_ingredient("flour")
    end
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    before(:each) do
      cake.add_ingredient("flour")
      cake.add_ingredient("baking soda")
      cake.add_ingredient("sugar")
      cake.mix!
    end
    it "shuffles the ingredient array" do
      expect(cake.ingredients).not_to eq(["flour","baking soda", "sugar"])
    end
  end

  describe "#eat" do
    before(:each) do
      cake.add_ingredient("flour")
      cake.add_ingredient("baking soda")
      cake.add_ingredient("sugar")
      cake.mix!
      cake.eat(1)
    end
    it "subtracts an amount from the quantity" do
      expect(cake.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ cake.eat(1) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chief the Great Baker")
      expect(cake.serve).to eq("Chef chief the Great Baker has made 1 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
