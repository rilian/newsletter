describe IssuesController do
  describe 'GET :index' do
    let!(:first_issue) { create :issue }
    let!(:second_issue) { create :issue }

    it 'returns issues page' do
      get :index

      expect(assigns(:issues)).to match_array [first_issue, second_issue]
      expect(subject).to render_template :index
      expect(response.status).to eq 200
    end
  end
end
