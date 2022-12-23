require 'rails_helper'

RSpec.describe "polls/edit", type: :view do
  let(:poll) {
    Poll.create!()
  }

  before(:each) do
    assign(:poll, poll)
  end

  it "renders the edit poll form" do
    render

    assert_select "form[action=?][method=?]", poll_path(poll), "post" do
    end
  end
end
