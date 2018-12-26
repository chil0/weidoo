require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :handle_name => "Handle Name"
      ),
      User.create!(
        :email => "Email",
        :handle_name => "Handle Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Handle Name".to_s, :count => 2
  end
end
