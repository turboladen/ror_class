require 'spec_helper'


describe User do
  context 'without an email address' do
    it 'fails validation' do
      expect(User.new).to have(1).error_on(:email)
    end
  end

  context 'with a duplicate email address' do
    it 'fails validation' do
      User.create!(email: 'test@test.com')
      expect(User.new(email: 'test@test.com')).to have(1).error_on(:email)
    end
  end

  it 'can have many photos' do
    user = User.new(email: 'test@test.com')
    2.times { user.photos << Photo.new }
    expect(user).to be_valid
  end
end
