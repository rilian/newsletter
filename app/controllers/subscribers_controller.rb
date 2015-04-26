class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end
end
