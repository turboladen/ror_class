require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :file_name => "File Name",
        :path => "Path"
      ),
      stub_model(Photo,
        :file_name => "File Name",
        :path => "Path"
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td>img", :src => "Path".to_s, :count => 2
  end
end
