class NotificationsController < ApplicationController
  before_action :logged_in_user

  def index
    reminds = Remind.joins(:remind_item)
                    .where(notified: false)
                    .where("remind_at <= ?", Time.now)
                    .where(remind_item: {user: current_user})
    reminds.update(notified: true)
    render json: reminds, include: [:remind_item]
  end
end
