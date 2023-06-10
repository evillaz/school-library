require_relative '../student'

describe Student do
    describe '#initialize' do
        it 'Creates a new student' do
        student = Student.new(20, 'name', true)
        expect(student).to be_a(Student)
        end
    end
    
    describe 'check attributes' do
        it 'checks age' do
        student = Student.new(20, 'name', true)
        expect(student.age).to eq(20)
        end
        it 'checks name' do
        student = Student.new(20, 'name', true)
        expect(student.name).to eq('name')
        end
    end
end