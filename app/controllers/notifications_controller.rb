class NotificationsController < ApplicationController
    def show
        @notifications = Notification.where(user_id: params[:id], status: Notification::UNREAD).where("delivery_date <= ?", Date.today)
        render json: {data: @notifications, success: true}, status: :ok
    end

    def update
        @notification = Notification.find(params[:id])
        if @notification.update(model_params)
            render json: {data: @notification, success: true}, status: :ok
        else
            render json: {data: @notification.errors, success: false}, status: :unprocessable_entity
        end
    end

    private

    def model_params
        params.require(:payload).permit(:id, :status)
    end
end
