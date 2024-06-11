class NotificationsController < ApplicationController

    skip_before_action:verify_authenticity_token

    def mark_as_read
        @notification = current_user.notifications.find(params[:id])
        @notification.update(read: true)
        render json: { success: true }
    end
end
