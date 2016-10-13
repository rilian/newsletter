# frozen_string_literal: true
describe Issue, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:desc).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:sent_at).of_type(:datetime) }
  end

  describe 'Relations' do
    it { is_expected.to have_many :links }
  end

  describe 'Callbacks' do
    context 'when issue was created' do
      let(:issue) { create :issue }

      it 'generates title on save if not specified' do
        expect(issue.title).to eq("Issue ##{issue.id}")
      end
    end
  end
end
