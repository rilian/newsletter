describe SubscribersController do
  describe 'GET index' do
    before { sign_in manager }

    let(:manager) { create :manager }

    it 'renders index template' do
      get :index

      expect(assigns(:subscribers)).to match_array Subscriber.all

      expect(response).to render_template(:index)
      expect(response.status).to eq 200
    end
  end
end
