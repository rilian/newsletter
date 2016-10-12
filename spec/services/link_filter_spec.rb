# frozen_string_literal: true
describe LinkFilter do
  subject { described_class.new(authenticated: authenticated, params: params) }

  let(:result) { subject.execute }

  let!(:sent_issue) { create :issue }
  let!(:not_sent_issue) { create :issue }

  let!(:simple_link) { create :link, title: 'Simple link' }
  let!(:special_link) { create :link, title: 'Special link' }

  let!(:unissued_tagged_link) do
    create :link, title: 'Unissued tagged link',
                  tag_list: %w[tag unissued]
  end

  let!(:attached_to_not_sent_issue_tagged_link) do
    create :link, title: 'Unissued tagged link',
                  tag_list: %w[tag unissued],
                  issue_id: not_sent_issue.id
  end

  let!(:issued_tagged_link) do
    create :link, title: 'Issued tagged link',
                  tag_list: %w[tag issued],
                  issue_id: sent_issue.id
  end

  before do
    sent_issue.update(sent_at: Time.zone.now)
  end

  context 'with authentication' do
    let(:authenticated) { true }

    context 'with existing tag param' do
      let(:params) { { tag: 'tag' } }

      it 'returns search by tag result' do
        expect(result).to include(unissued_tagged_link,
          issued_tagged_link,
          attached_to_not_sent_issue_tagged_link)
      end
    end

    context 'with query param' do
      let(:params) { { q: { url_or_title_cont: 'special' } } }

      it 'returns search result' do
        expect(result).not_to include simple_link
        expect(result).to include special_link
      end
    end
  end

  context 'without authentication' do
    let(:authenticated) { false }

    context 'without tag param' do
      let(:params) { {} }

      it 'returns empty search by tag result' do
        expect(result).to eq []
      end
    end

    context 'with non existing tag param' do
      let(:params) { { tag: 'non_existing_tag' } }

      it 'returns empty search by tag result' do
        expect(result).to eq []
      end
    end

    context 'with existing on unissued links tag param' do
      let(:params) { { tag: 'unissued' } }

      it 'does not return unissued links' do
        expect(result).not_to include(unissued_tagged_link,
          attached_to_not_sent_issue_tagged_link)
      end
    end

    context 'with existing on issued link tag param' do
      let(:params) { { tag: 'issued' } }

      it 'returns issued link' do
        expect(result).to include issued_tagged_link
      end
    end
  end
end
