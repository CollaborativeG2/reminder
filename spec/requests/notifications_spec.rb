require 'rails_helper'

RSpec.describe "Reminders", type: :request do
  let(:user) {create(:user)}
  before do
    log_in(user)
  end
  describe "GET /notifications" do
    context "success get notifications" do
      let!(:remind_item) {create(:remind_item, user: user)}
      let!(:remind) {create(:remind, remind_at: Time.current.ago(1.minute),remind_item: remind_item)}
      it do
        get notifications_url
        expect(response).to have_http_status(:success)
      end
    end
  end
end