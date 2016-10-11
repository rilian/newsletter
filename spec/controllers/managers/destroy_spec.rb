describe ManagersController, type: :controller do
  describe 'DELETE :destroy' do
    before { sign_in manager }

    let(:manager) { create :manager }

    let(:target_manager) { create :manager }

    context 'when manager exists' do
      it 'deletes manager' do
        delete :destroy, id: target_manager.id

        expect(Manager.find_by_id(target_manager.id)).to be_nil

        expect(subject).to redirect_to managers_path
        expect(response.status).to eq 302
      end
    end

    context 'when manager does not exist' do
      it 'redirects to root page with error' do
        delete :destroy, id: 0

        expect(flash[:error]).to eq "Couldn't find Manager with 'id'=0"
        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
