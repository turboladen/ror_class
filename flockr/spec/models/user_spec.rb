require 'spec_helper'


describe User do
  context 'without an email address' do
    it 'fails validation' do
      expect(User.new).to have(1).error_on(:email)
    end
  end
end
