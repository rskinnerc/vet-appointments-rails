require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/doctors/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/doctors/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/doctors/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
