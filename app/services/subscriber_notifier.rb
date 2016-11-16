# frozen_string_literal: true
class SubscriberNotifier
  def initialize(issue_id, subscriber_id)
    @issue = Issue.find issue_id
    @subscriber = Subscriber.find subscriber_id
  end

  def perform
    IssueMailer.notify_subscriber(issue: @issue, subscriber: @subscriber).deliver_now
  end
end
