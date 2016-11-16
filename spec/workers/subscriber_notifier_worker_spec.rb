# frozen_string_literal: true
describe SubscriberNotifierWorker do
  context 'Functionality' do
    let(:issue) { create :issue, sent_at: Time.zone.now }
    let(:subscriber) { create :subscriber }

    it 'sends notification email to subscriber' do
      described_class.perform_async(issue.id, subscriber.id)

      expect(ActionMailer::Base.deliveries.count).to eq 1
    end
  end
end
