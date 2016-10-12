# frozen_string_literal: true
describe IssueMailer do
  describe 'Notify subscriber' do
    let!(:issue) { create :issue, sent_at: Time.zone.now }
    let!(:link) { create :link, issue_id: issue.id }

    let(:subscriber) { create :subscriber }

    let(:mail_delivery) { ActionMailer::Base.deliveries.first }

    it 'sends issue' do
      described_class.notify_subscriber(issue: issue, subscriber: subscriber).deliver_now

      expect(mail_delivery.subject).to eq "[#{ENV['ISSUE_MAIL_SUBJECT']}] #{issue.title}"
      expect(mail_delivery.to).to eq [subscriber.email]
      expect(mail_delivery.from).to eq [ENV['MAIL_FROM']]
      expect(mail_delivery.body).to include issue.title
      expect(mail_delivery.body).to include link.url
      expect(mail_delivery.body).to include issue_url(issue, host: ENV['DOMAIN'])
      expect(mail_delivery.body).to include root_url(host: ENV['DOMAIN'])
    end
  end
end
