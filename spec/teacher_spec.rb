require_relative '../person'
require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'John Doe') }

  describe '#initialize' do
    it 'creates a Teacher object with the given age and name' do
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('John Doe')
    end

    it 'sets the name to "Unknown" if no name is provided' do
      teacher_without_name = Teacher.new(40)
      expect(teacher_without_name.name).to eq('Unknown')
    end
  end

  describe '#can_use_services' do
    it 'returns true' do
      expect(teacher.can_use_services).to be true
    end
  end
end
