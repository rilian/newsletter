# frozen_string_literal: true
describe Link, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:desc).of_type(:text) }
    it { is_expected.to have_db_column(:url).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:time_to_read).of_type(:integer) }
    it { is_expected.to have_db_column(:issue_id).of_type(:integer) }
    it { is_expected.to have_db_column(:manager_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { is_expected.to have_db_index(:issue_id) }
    it { is_expected.to have_db_index(:manager_id) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:issue) }
    it { is_expected.to belong_to(:manager) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_numericality_of(:time_to_read).is_greater_than_or_equal_to(0) }

    it 'validates uniqueness of url' do
      described_class.new(url: 'example.com').save

      expect(described_class.new(url: 'example.com').save).to eq false
      expect(described_class.all.count).to eq 1
    end
  end

  describe 'Callbacks' do
    context 'with link cleanup before saving' do
      context 'with valid url' do
        it 'removes utm codes from url params' do
          link = described_class.new(url: 'example.com?a=b&utm_source=x')
          link.save

          expect(link.url).to eq 'example.com?a=b'
        end
      end

      context 'with invalid url' do
        before do
          allow_any_instance_of(URI::Generic).to receive(:query).and_raise(URI::InvalidURIError)
        end

        it 'rescues from URI::InvalidURIError error and does not change url' do
          link = described_class.new(url: 'example.com?a=b&utm_source=x')
          link.save

          expect(link.url).to eq 'example.com?a=b&utm_source=x'
        end
      end
    end
  end
end
