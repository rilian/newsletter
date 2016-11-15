# frozen_string_literal: true
describe SubscribersController, type: :controller do
  describe 'GET :manage' do
    let(:subscriber) { create :subscriber }

    it 'returns subscriber manage page' do
      get :manage, params: { uuid: subscriber.uuid }

      expect(assigns(:subscriber)).to eq subscriber

      expect(subject).to render_template :manage
      expect(response.status).to eq 200
    end
  end
end
