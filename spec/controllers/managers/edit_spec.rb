describe ManagersController, type: :controller do
  describe 'GET :edit' do
    before { sign_in manager }

    let(:manager) { create :manager }

    let(:target_manager) { create :manager }

    context 'when manager exists' do
      it 'returns issue edit page' do
        get :edit, id: target_manager.id

        expect(assigns(:manager)).to eq target_manager

        expect(subject).to render_template :edit
        expect(response.status).to eq 200
      end
    end

    context 'when manager does not exist' do
      it 'redirects to root page with error' do
        get :edit, id: 0

        expect(flash[:error]).to eq "Couldn't find Manager with 'id'=0"
        expect(assigns(:manager)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
