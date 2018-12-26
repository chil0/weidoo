require 'rails_helper'

RSpec.describe "chirps/index", type: :view do
  before(:each) do
    assign(:chirps, [
      Chirp.create!(
        :user_id => 2,
        :chirp => "Chirp",
        :photo => "",
        :file_name => "File Name",
        :file_type => "File Type"
      ),
      Chirp.create!(
        :user_id => 2,
        :chirp => "Chirp",
        :photo => "",
        :file_name => "File Name",
        :file_type => "File Type"
      )
    ])
  end

  it "renders a list of chirps" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Chirp".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "File Type".to_s, :count => 2
  end
end
