require_relative '../person'
require_relative '../student'

RSpec.describe Student do
  let(:student) { Student.new(16, 'Alice') }
  describe '#initialize' do
    it 'creates a Student object with the given age and name' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('Alice')
    end
    it 'sets the name to "Unknown" if no name is provided' do
      student_without_name = Student.new(18)
      expect(student_without_name.name).to eq('Unknown')
    end
  end

  describe '#assign_classroom' do
    it 'assigns a classroom to the student' do
      classroom = double('Classroom')
      expect(classroom).to receive(:add_student).with(student)

      student.assign_classroom(classroom)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#play_hooky' do
    it 'returns the "shrug" emoticon' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#to_s' do
    it 'returns a formatted string with student information' do
      student.parent_permission = true
      student.instance_variable_set(:@id, 456)
      expected_string = 'Student: Alice, Age: 16, Parent Permission: true ID:456'
      expect(student.to_s).to eq(expected_string)
    end
  end
end
