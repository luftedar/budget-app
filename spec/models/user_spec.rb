require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @test_user = User.new(name: 'testuser', email: 'test@test.com', password: 'testpass')
  end

  before { subject.save }

  it 'Validates Provided Subject' do
    expect(subject).to be_valid
  end

  it 'Validates Wrong Given User Name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Validates Wrong Given Email' do
    subject.email = '1'
    expect(subject).to_not be_valid
  end
end
