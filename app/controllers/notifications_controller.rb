class NotificationsController < ApplicationController
  def index
    reminds = Remind.where(notified: false).where("remind_at <= ?", Time.now)
    reminds.update(notified: true)
    render json: reminds, include: [:remind_item]
  end
end