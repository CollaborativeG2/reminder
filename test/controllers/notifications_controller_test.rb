require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)

    @remind_item_one = remind_items(:remind_item_one)

    @remind_one = reminds(:remind_one)
  end

  test "should get index" do
    get notifications_url
    assert_response :success
  end
end
