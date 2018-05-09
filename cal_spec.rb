# calculatorspec
class Calculator
  def add(first = 0, second = 0)
    if first == ' ' || second == ' '
      0
    else
      first + second
    end
  end
end

describe Calculator do
  let(:cal) { Calculator.new }
  describe '#add' do
    it 'no argument should return 0' do
      expect(cal.add).to eq(0)
    end
    it 'empty string should return 0' do
      expect(cal.add(' ')).to eq(0)
    end
    it 'add two arg' do
      expect(cal.add(10, 6)).to eq(16)
    end
    it 'return the single argument value if not two argument provided' do
      expect(cal.add(2)).to eq(2)
    end
    it 'string arg return 0' do
      expect(cal.add(' ', 4)).to eq(0)
    end
  end
end
