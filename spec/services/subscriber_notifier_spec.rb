# frozen_string_literal: true
describe SubscriberNotifier do
  let(:issue) { create :issue, sent_at: Time.zone.now }
  let(:subscriber) { create :subscriber }

  subject { described_class.new(issue.id, subscriber.id) }

  it 'sends notification email to subscriber' do
    expect(subject.perform).to be_truthy
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end
end
