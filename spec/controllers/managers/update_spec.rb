# frozen_string_literal: true
describe ManagersController, type: :controller do
  describe 'PATCH :update' do
    before { sign_in(manager) }

    let(:manager) { create :manager }

    let(:target_manager) { create :manager }

    context 'with valid params' do
      it 'updates manager' do
        patch :update, params: { id: target_manager.id, manager: { email: 'something@example.com' } }

        target_manager.reload

        expect(target_manager.email).to eq 'something@example.com'
        expect(assigns(:manager)).to eq target_manager

        expect(subject).to redirect_to managers_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Manager).to receive(:update).and_return(false)
      end

      it 'renders form' do
        post :update, params: { id: target_manager.id, manager: { email: 'something@example.com' } }

        expect(subject).to render_template :edit
        expect(response.status).to eq 200
      end
    end

    context 'when manager does not exist' do
      it 'redirects to root page with error' do
        patch :update, params: { id: 0 }

        expect(flash[:error]).to eq "Couldn't find Manager with 'id'=0"
        expect(assigns(:manager)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
