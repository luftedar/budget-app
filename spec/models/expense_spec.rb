require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject do
    @test_user = User.new(name: 'testuser', email: 'test@test.com', password: 'testpass')
    @test_group = @test_user.groups.new(name: 'testgroup',
                                        icon: 'https://media.istockphoto.com/vectors/flat-icon-check-vector-id496603666?k=20&m=496603666&s=170667a&w=0&h=QOfI-aqzv1dEamb2evpWUvKkukJwtH4YRF_Ugwksk6Y=',
                                        user_id: @test_user.id)
    @test_expense = @test_user.expenses.new(name: 'testgroup', amount: 100.0, user_id: @test_user.id, group: @test_group)
  end
  before { subject.save }

  it 'Validates Provided User' do
    expect(subject).to be_valid
  end

  it 'Validates Wrong Given User Name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Validates Amount Value Type' do
    expect(subject.amount).to be_kind_of Numeric
  end

  it 'Validates Wrong Given Amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Validates If Given Amount Is Greater Than Zero' do
    subject.amount = -100
    expect(subject).to_not be_valid
  end

  it 'Should be Associated with the Group' do
    expect(subject).to respond_to(:group)
  end

  it 'Should be Associated with the User' do
    expect(subject).to respond_to(:user)
  end
end
