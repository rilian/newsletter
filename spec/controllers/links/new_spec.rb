describe LinksController, type: :controller do
  describe 'GET :new' do
    before { sign_in manager}

    let(:manager) { create :manager }

    it 'returns new link page' do
      get :new

      expect(assigns(:link).class).to eq Link
      expect(assigns(:link).new_record?).to eq true
      expect(subject).to render_template :new
      expect(response.status).to eq 200
    end
  end
end
