# frozen_string_literal: true
class SubscriberNotifierWorker
  include Sidekiq::Worker

  def perform(issue_id, subscriber_id)
    SubscriberNotifier.new(issue_id, subscriber_id).perform
  end
end
