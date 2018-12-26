require 'rails_helper'

RSpec.describe "chirps/edit", type: :view do
  before(:each) do
    @chirp = assign(:chirp, Chirp.create!(
      :user_id => 1,
      :chirp => "MyString",
      :photo => "",
      :file_name => "MyString",
      :file_type => "MyString"
    ))
  end

  it "renders the edit chirp form" do
    render

    assert_select "form[action=?][method=?]", chirp_path(@chirp), "post" do

      assert_select "input[name=?]", "chirp[user_id]"

      assert_select "input[name=?]", "chirp[chirp]"

      assert_select "input[name=?]", "chirp[photo]"

      assert_select "input[name=?]", "chirp[file_name]"

      assert_select "input[name=?]", "chirp[file_type]"
    end
  end
end
