
class Calculator

	def add(a=0,b=0)

		if a == "" || b == ""
			0
		else 
			a+b
		end
	end 
end 

describe Calculator do
	cal = Calculator.new 
	describe "#add" do
		it "no argument should return 0" do
			expect(cal.add()).to eq(0)
		end 
		it "empty string should return 0" do
			expect(cal.add("")).to eq(0)
		end
		it "add two arg" do
			expect(cal.add(10,6)).to eq(16)
		end

		it "return the single argument value if not two argument provided" do
			expect(cal.add(2)).to eq(2)
		end

		it "string arg return 0" do
			expect(cal.add("",4)).to eq(0)
		end
	end
end 

