require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let!(:user) {create(:user)}
  before do
    log_in_as(user)
  end

  describe "#current_user" do
    it "current_user returns right user when session is nil" do
      expect(user).to eq helper.current_user
      expect(is_logged_in?).to eq true
    end
  end
end