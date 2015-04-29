class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @issues = Issue.all.order(id: :desc)
  end
end
