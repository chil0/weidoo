require 'rails_helper'

RSpec.describe "chirps/show", type: :view do
  before(:each) do
    @chirp = assign(:chirp, Chirp.create!(
      :user_id => 2,
      :chirp => "Chirp",
      :photo => "",
      :file_name => "File Name",
      :file_type => "File Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Chirp/)
    expect(rendered).to match(//)
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/File Type/)
  end
end
