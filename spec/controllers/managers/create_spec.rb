# frozen_string_literal: true
describe ManagersController, type: :controller do
  describe 'POST :create' do
    before { sign_in(manager) }

    let(:manager) { create :manager }

    context 'with valid params' do
      it 'creates manager' do
        post :create, manager: { email: 'mail@example.com', password: '1234567890' }

        expect(assigns(:manager)).to eq Manager.where(email: 'mail@example.com').first

        expect(subject).to redirect_to managers_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      it 'renders form' do
        post :create, manager: { email: '' }

        expect(subject).to render_template :new
        expect(response.status).to eq 200
      end
    end
  end
end
