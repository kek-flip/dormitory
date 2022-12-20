require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /view" do
    it "returns http success" do
      get "/main/view"
      expect(response).to have_http_status(:success)
    end
  end

end
