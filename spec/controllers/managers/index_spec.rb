describe ManagersController do
  describe 'GET index' do
    before { sign_in manager }

    let(:manager) { create :manager }

    it 'renders index template' do
      get :index

      expect(assigns(:managers)).to match_array Manager.all

      expect(response).to render_template(:index)
      expect(response.status).to eq 200
    end
  end
end
