# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @issues = Issue.page(params[:page]).all.order(id: :desc)
    @q = Link.ransack(params[:q])
  end
end
