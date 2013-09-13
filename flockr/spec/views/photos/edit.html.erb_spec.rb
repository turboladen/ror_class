require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :file_name => "MyString",
      :path => "MyString"
    ))

    @user = assign(:user, stub_model(User,
      :username => "MyString",
      :email => "MyString@email.com"
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_photo_path(@user, @photo), "post" do
      assert_select "input#photo_file_name[name=?]", "photo[file_name]"
      assert_select "input#photo_path[name=?]", "photo[path]"
    end
  end
end
