require './methods'

describe Enumerable do
  describe "#my_inject" do
    it "multiplies the array elements" do

      expect([1,2,3].my_inject{ |memo, item| memo * item }).to eql(6)

    end
  end

  describe "#my_each" do
    it "iterates through an array" do
      arr = [1,2,3]
      expect(arr.my_each{ |item| p (item + 16) }).to eql([1, 2, 3])
    end
  end

  describe "#my_all" do
    it "checks if all elements return true in context of block passed" do
      expect([0,2,3].my_all{ |item| item >= 0 }).to eql(true)
      expect([1,-2,3].my_all{ |item| item < 0 }).to eql(false)
    end
  end

  describe "#my_any" do
    it "checks if any element returns true in context of block passed" do
      expect([0,2,3].my_any{ |item| item >= 0 }).to eql(true)
      expect([1,-2,3].my_any{ |item| item < 0 }).to eql(true)
      expect([1,2,3].my_any{ |item| item < 0 }).to eql(false)
    end
  end

  describe "#my_map" do
    it "returns modified array in context of block pased" do
      expect([0,2,3].my_map{ |item| item * 2 }).to eql([0,4,6])
      expect([1,-2,3].my_map{ |item| item * 2 }).to eql([2,-4,6])
      expect([1,2,3].my_map{ |item| item * 2 }).to eql([2,4,6])
    end
  end

  describe "#my_count" do
    it "counts elements of an array, or elements that return true in context of block of code passed" do
      expect([1,2,3].my_count).to eql(3)
      expect([1,2,3].my_count{|item| item > 2}).to eql(1)
    end
  end

end
