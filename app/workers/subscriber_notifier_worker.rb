# frozen_string_literal: true
class SubscriberNotifierWorker
  include Sidekiq::Worker

  def perform(issue, subscriber)
    SubscriberNotifier.new(issue, subscriber).perform
  end
end
