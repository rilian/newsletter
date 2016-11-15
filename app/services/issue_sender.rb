# frozen_string_literal: true
class IssueSender
  def initialize(issue)
    @issue = issue
  end

  def perform
    Link.without_issue.update_all(issue_id: @issue_id)
    @issue.update(sent_at: Time.zone.now)
    Subscriber.active.find_each(batch_size: 10) do |subscriber|
      SubscriberNotifierWorker.perform_async(@issue.id, subscriber.id)
    end
  end
end
