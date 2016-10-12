# frozen_string_literal: true
describe SubscribersController, type: :controller do
  describe 'POST :create' do
    context 'with valid params' do
      it 'creates subscriber' do
        post :create, subscriber: { email: 'mail@example.com' }

        subscriber = Subscriber.find_by_email('mail@example.com')

        expect(assigns(:subscriber)).to eq subscriber

        expect(subject).to redirect_to action: :manage, uuid: subscriber.uuid
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      it 'renders form' do
        post :create, subscriber: { email: '' }

        expect(subject).to render_template :new
        expect(response.status).to eq 200
      end
    end
  end
end
