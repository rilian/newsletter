class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(create_subscriber_params)
    if @subscriber.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @subscriber = Subscriber.find_by_uuid(params[:uuid])
    if @subscriber.update(update_subscriber_params)
      redirect_to root_path
    else
      render :manage
    end
  end

  def manage
    @subscriber = Subscriber.find_by_uuid(params[:uuid])
  end

private

  def create_subscriber_params
    params.require(:subscriber).permit(:email)
  end

  def update_subscriber_params
    params.require(:subscriber).permit(:is_active)
  end
end
