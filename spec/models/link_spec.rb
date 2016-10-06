describe Link, type: :model do
  describe 'Database' do
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

    it 'removes utm codes from link params' do
      link = described_class.new(url: 'google.com?a=b&utm_source=x')
      link.save
      expect(link.url).to eq 'google.com?a=b'
    end
  end
end
