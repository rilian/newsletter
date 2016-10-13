# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Concerns::SentryConfigs
  before_action :set_raven_context

  rescue_from ActiveRecord::RecordNotFound do |e|
    respond_to do |f|
      f.html do
        flash[:error] = e.message
        redirect_to root_path
      end
    end
  end
end
