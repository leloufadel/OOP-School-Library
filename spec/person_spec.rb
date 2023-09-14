require_relative '../book'
require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new(18, 'John Doe') }

  describe '#initialize' do
    it 'creates a Person object with the provided age and name' do
      expect(person.age).to eq(18)
      expect(person.name).to eq('John Doe')
    end

    it 'sets the name to "Unknown" if no name is provided' do
      person_without_name = Person.new(25)
      expect(person_without_name.name).to eq('Unknown')
    end

    it 'generates a random id' do
      expect(person.id).to be_between(1, 1_000)
    end

    it 'initializes rentals as an empty array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a person of age 18' do
      person = Person.new(18)
      expect(person.can_use_services?).to be true
    end
  end
end
