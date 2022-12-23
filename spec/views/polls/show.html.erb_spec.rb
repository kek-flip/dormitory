require 'rails_helper'

RSpec.describe "polls/show", type: :view do
  before(:each) do
    assign(:poll, Poll.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
