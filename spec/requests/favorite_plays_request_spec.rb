require 'rails_helper'

RSpec.describe "FavoritePlays", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/favorite_plays/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/favorite_plays/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
