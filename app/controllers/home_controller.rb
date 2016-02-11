class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @issues = Issue.page(params[:page]).all.order(id: :desc)
  end
end
