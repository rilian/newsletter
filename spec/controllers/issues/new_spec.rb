# frozen_string_literal: true
describe IssuesController, type: :controller do
  describe 'GET :new' do
    before { sign_in manager }

    let(:manager) { create :manager }

    let!(:first_link) { create :link }
    let!(:second_link) { create :link }

    it 'returns new issue page' do
      get :new

      expect(assigns(:issue).class).to eq Issue
      expect(assigns(:issue).new_record?).to eq true

      expect(assigns(:links)).to match_array [first_link, second_link]

      expect(subject).to render_template :new
      expect(response.status).to eq 200
    end
  end
end
