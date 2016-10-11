describe SubscribersController, type: :controller do
  describe 'PATCH :update' do
    let(:subscriber) { create :subscriber }

    context 'with valid params' do
      it 'updates subscriber' do
        patch :update, id: subscriber.id, uuid: subscriber.uuid, subscriber: { is_active: false }

        subscriber.reload

        expect(subscriber.is_active).to eq false
        expect(assigns(:subscriber)).to eq subscriber

        expect(subject).to redirect_to action: :manage, uuid: subscriber.uuid
        expect(response.status).to eq 302
      end
    end
  end
end
