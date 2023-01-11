require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) {create(:user)}

  describe "GET /users" do
    it do
      get users_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/new" do
    it do
      get new_user_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users" do
    it do
      post users_url, params: { user: { email: user.email, name: user.name } }
      expect(response).to redirect_to(User.last)
    end
  end

  describe "GET /users/:id" do
    it do
      get user_url(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/:id/edit" do
    it do
      get edit_user_url(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /users/:id" do
    it do
      patch user_url(user), params: { user: { email: user.email, name: user.name } }
      expect(response).to redirect_to(user)
    end
  end

  describe "DELETE /users/:id" do
    it do
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
