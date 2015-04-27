class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
  end
end
