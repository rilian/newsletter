# frozen_string_literal: true
describe ManagersController, type: :controller do
  describe 'GET :new' do
    before { sign_in manager }

    let(:manager) { create :manager }

    it 'returns new issue page' do
      get :new

      expect(assigns(:manager).class).to eq Manager
      expect(assigns(:manager).new_record?).to eq true

      expect(subject).to render_template :new
      expect(response.status).to eq 200
    end
  end
end
