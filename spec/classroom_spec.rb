require_relative '../classroom'

describe Classroom do
    describe '#initialize' do
        it 'Creates a new classroom' do
        classroom = Classroom.new('Physics')
        expect(classroom).to be_a(Classroom)
        end
    end
    
    describe 'check attributes' do
        it 'checks name' do
        classroom = Classroom.new('Physics')
        expect(classroom.label).to eq('Physics')
        end
    end

    describe 'check methods' do
        it 'checks add_student method' do
        classroom = Classroom.new('Physics')
        student = Student.new(20, 'name', true)
        classroom.add_student(student)
        expect(classroom.students).to include(student)
        end
    end
end