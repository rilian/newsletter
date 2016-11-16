# frozen_string_literal: true
describe IssueSender do
  let!(:issue) { create :issue }
  let!(:link) { create :link }
  let!(:subscriber) { create :subscriber }

  subject { described_class.new(issue) }

  it 'send issue to subscribers' do
    expect(subject.perform).to be_truthy
    expect(issue.sent_at).not_to be_nil
    expect(link.reload.issue_id).to eq issue.id
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end
end
