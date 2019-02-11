require './methods'

describe Enumerable do
  context "#my_inject" do
    it "multiplies the array elements" do

      expect [1,2,3].my_inject{ |memo, item| memo * item }.to eql(6)

    end
  end
end
