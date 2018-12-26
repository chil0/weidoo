require 'rails_helper'

RSpec.describe "chirps/new", type: :view do
  before(:each) do
    assign(:chirp, Chirp.new(
      :user_id => 1,
      :chirp => "MyString",
      :photo => "",
      :file_name => "MyString",
      :file_type => "MyString"
    ))
  end

  it "renders new chirp form" do
    render

    assert_select "form[action=?][method=?]", chirps_path, "post" do

      assert_select "input[name=?]", "chirp[user_id]"

      assert_select "input[name=?]", "chirp[chirp]"

      assert_select "input[name=?]", "chirp[photo]"

      assert_select "input[name=?]", "chirp[file_name]"

      assert_select "input[name=?]", "chirp[file_type]"
    end
  end
end
