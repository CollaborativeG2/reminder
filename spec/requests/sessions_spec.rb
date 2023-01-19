require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) {create(:user)}

  describe "GET /login" do
    it do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "post /login" do
    it do
      post login_path, params: {session: {email: user.email, password: user.password}}
      expect(response).to redirect_to(root_url)
    end
  end

  describe "DELETE /logout" do
    before do
      log_in(user)
    end
    it do
      delete logout_path
      expect(response).to redirect_to(root_url)
    end
  end
end
