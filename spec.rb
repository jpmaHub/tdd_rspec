# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.
class AddressBook
  def initialize(first_line, city, postcode)
    @first_line = first_line
    @city = city
    @postcode = postcode
  end

  def full_name_add
    "#{@first_line} #{@city} #{@postcode}".split.join(' ')
  end
end
###
class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here

  def full_name
    "#{@first_name} #{@middle_name} #{@last_name}".split.join(' ')
  end

  def add_contact(contact)
    full_name + ' ' + contact
  end

  def full_name_with_middle_initial
    if @middle_name.nil?
      @first_name + ' ' + @last_name
    else
      @first_name + ' ' + @middle_name[0] + '. ' + @last_name
    end
  end

  def initials
    "#{@first_name} #{@middle_name} #{@last_name}".split.map(&:chr).join
  end
end

RSpec.describe Person do
  let(:person_full) { Person.new(first_name: 'John', middle_name: 'Lee', last_name: 'Cooper') }
  let(:person_fl) { Person.new(first_name: 'John', last_name: 'Cooper') }
  let(:add) { AddressBook.new('345', 'London', 'EC1290') }
  describe '#full_name' do
    let(:add_name) { 'John Lee Cooper 345 London EC1290' }
    let(:add_nm) { 'John Cooper 345 London EC1290' }
    it 'concatenates first name, middle name, and last name with spaces' do
      expect(person_full.full_name).to eq('John Lee Cooper')
      expect(person_full.add_contact(add.full_name_add)).to eq(add_name)
    end
    it 'does not add extra spaces if middle name is missing' do
      expect(person_fl.full_name).to eq('John Cooper')
    end
    it 'add contact with name' do
      expect(person_fl.add_contact(add.full_name_add)).to eq(add_nm)
    end
  end

  describe '#full_name_with_middle_initial' do
    it 'concatenates first_name and last_name with a middle_name initial' do
      expect(person_full.full_name_with_middle_initial).to eq('John L. Cooper')
    end
    it 'does not add extra spaces or a period if middle_name is missing' do
      expect(person_fl.full_name_with_middle_initial).to eq('John Cooper')
    end
  end

  describe '#initials' do
    it 'return all initial for first_name , middle_name and last_name ' do
      expect(person_full.initials).to eq('JLC')
    end
    it 'only return two characters if middle_name is missing' do
      expect(person_fl.initials).to eq('JC')
    end
  end
end
