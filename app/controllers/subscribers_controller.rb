class SubscribersController < ApplicationController
  before_action :authenticate_manager!, except: %i[new create update manage]

  def index
    @subscribers = Subscriber.all.order(id: :desc)
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(create_subscriber_params)
    if @subscriber.save
      redirect_to manage_subscribers_path(uuid: @subscriber.uuid)
    else
      render :new
    end
  end

  def update
    @subscriber = Subscriber.find_by_uuid(params[:uuid])
    if @subscriber.update(update_subscriber_params)
      redirect_to manage_subscribers_path(uuid: @subscriber.uuid)
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
