require 'spec_helper'

describe "Photos" do
  describe "GET /photos" do
    it "works! (now write some real specs)" do
      user = User.first || User.create(email: 'test@test.com', username: 'test')

      get user_photos_path(user)
      response.status.should be(200)
    end
  end
end
