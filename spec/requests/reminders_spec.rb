require 'rails_helper'

RSpec.describe "Reminders", type: :request do
  let(:user) {create(:user)}
  before do
    log_in(user)
  end

  describe "GET /reminders" do
    context "success get reminders" do
      let!(:remind_item) {create(:remind_item, user: user)}
      let!(:remind) {create(:remind, remind_item: remind_item)}
      it do
        get reminders_url
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /reminders/new" do
    it do
      get new_reminder_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /reminders" do
    it do
      post reminders_url, params: { remind_item: { description: "test" }, remind: {remind_at: "2023-1-26 21:19:00"} }
      expect(response).to redirect_to(reminders_url)
    end
  end

  describe "GET /reminders/:id" do
    context "success get reminder" do
      let!(:remind_item) {create(:remind_item, user: user)}
      let!(:remind) {create(:remind, remind_item: remind_item)}
      it do
        get reminder_path(remind_item.id)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE /reminders/:id" do
    context "success delete reminder" do
      let!(:remind_item) {create(:remind_item, user: user)}
      let!(:remind) {create(:remind, remind_item: remind_item)}
      it do
        delete reminder_path(remind_item.id)
        expect(response).to redirect_to(reminders_url)
      end
    end
  end
end