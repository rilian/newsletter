describe HomeController do
  describe 'GET :index' do
    it 'renders index template' do
      get :index

      expect(assigns(:subscriber).new_record?).to eq true
      expect(assigns(:issues)).to match_array Issue.all

      expect(subject).to render_template :index
    end
  end
end
