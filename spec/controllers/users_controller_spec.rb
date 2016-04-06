require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    user = User.create(username: "Tester", email: "test@testy.com", password: "helloworld", password_confirmation: "helloworld")
    user.confirm
    sign_in user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
