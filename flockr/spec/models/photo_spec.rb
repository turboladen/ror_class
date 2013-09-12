require 'spec_helper'

describe Photo do
  it 'can belong to a user' do
    user = User.new
    photo = Photo.new(user: user)
    photo.should be_valid
  end
end
