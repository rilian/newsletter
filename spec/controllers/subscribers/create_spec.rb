describe SubscribersController, type: :controller do
  describe 'POST :create' do
    context 'with valid params' do
      it 'creates subscriber' do
        post :create, subscriber: { email: 'mail@example.com' }

        subscriber = Subscriber.where(email: 'mail@example.com').first

        expect(assigns(:subscriber)).to eq subscriber

        expect(subject).to redirect_to action: :manage, uuid: subscriber.uuid
        expect(response.status).to eq 302
      end
    end
  end
end
