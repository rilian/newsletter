# frozen_string_literal: true
describe SubscribersController, type: :controller do
  describe 'GET :new' do
    it 'returns new subscriber page' do
      get :new

      expect(assigns(:subscriber).class).to eq Subscriber
      expect(assigns(:subscriber).new_record?).to eq true

      expect(subject).to render_template :new
      expect(response.status).to eq 200
    end
  end
end
