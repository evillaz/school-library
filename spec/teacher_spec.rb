require_relative '../teacher'

describe Teacher do
    describe '#initialize' do
        it 'Creates a new teacher' do
        teacher = Teacher.new(20, 'name', 'specialization')
        expect(teacher).to be_a(Teacher)
        end
    end
    
    describe 'check attributes' do
        it 'checks age' do
        teacher = Teacher.new(20, 'name', 'specialization')
        expect(teacher.age).to eq(20)
        end
        it 'checks name' do
        teacher = Teacher.new(20, 'name', 'specialization')
        expect(teacher.name).to eq('name')
        end
        it 'checks specialization' do
        teacher = Teacher.new(20, 'name', 'specialization')
        expect(teacher.specialization).to eq('specialization')
        end
        it 'Checks can_use_services? method' do
        teacher = Teacher.new(20, 'name', 'specialization')
        expect(teacher.can_use_services?).to eql(true)
        end
    end
end