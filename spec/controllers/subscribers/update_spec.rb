# frozen_string_literal: true
describe SubscribersController, type: :controller do
  describe 'PATCH :update' do
    let(:subscriber) { create :subscriber }

    context 'with valid params' do
      it 'updates subscriber' do
        patch :update, params: { id: subscriber.id, uuid: subscriber.uuid, subscriber: { is_active: false } }

        subscriber.reload

        expect(subscriber.is_active).to eq false
        expect(assigns(:subscriber)).to eq subscriber

        expect(subject).to redirect_to action: :manage, uuid: subscriber.uuid
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Subscriber).to receive(:update).and_return(false)
      end

      it 'renders form' do
        patch :update, params: { id: subscriber.id, uuid: subscriber.uuid, subscriber: { is_active: false } }

        expect(subject).to render_template :manage
        expect(response.status).to eq 200
      end
    end
  end
end
