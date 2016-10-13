# frozen_string_literal: true
describe HomeController do
  describe 'GET :index' do
    let!(:issue_1) { create :issue }
    let!(:issue_2) { create :issue }
    let!(:issue_3) { create :issue }

    it 'renders index template' do
      get :index

      expect(assigns(:subscriber).new_record?).to eq true
      expect(assigns(:issues)).to match_array [issue_1, issue_2, issue_3]

      expect(subject).to render_template :index
    end
  end
end
