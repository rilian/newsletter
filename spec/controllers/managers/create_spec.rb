describe ManagersController, type: :controller do
  describe 'POST :create' do
    before { sign_in(manager) }

    let(:manager) { create :manager }

    context 'with valid params' do
      it 'creates manager' do
        post :create, manager: {email: 'mail@example.com', password: '1234567890'}

        expect(assigns(:manager)).to eq Manager.where(email: 'mail@example.com').first

        expect(subject).to redirect_to managers_path
        expect(response.status).to eq 302
      end
    end
  end
end
