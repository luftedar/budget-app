require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @test_user = User.new(name: 'testuser', email: 'test@test.com', password: 'testpass')
    @test_group = @test_user.groups.new(name: 'testgroup',
                                        icon: 'https://media.istockphoto.com/vectors/flat-icon-check-vector-id496603666?k=20&m=496603666&s=170667a&w=0&h=QOfI-aqzv1dEamb2evpWUvKkukJwtH4YRF_Ugwksk6Y=',
                                        user_id: @test_user.id)
  end
  before { subject.save }

  it 'Validates Provided Subject' do
    expect(subject).to be_valid
  end

  it 'Validates Wrong Given Name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Validates Wrong Given Icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
