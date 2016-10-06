describe LinksController do
  describe 'GET index' do
    let(:manager) { create :manager }

    context 'with manager' do
      context 'when tag param specified' do
        it 'renders index template' do
          sign_in(manager)
          get :index, { tag: 'test' }
          expect(response).to render_template(:index)
        end
      end
    end

    context 'with guest' do
      context 'when tag param specified' do
        it 'renders search_by_tag template' do
          get :index, { tag: 'test' }
          expect(response).to render_template(:search_by_tag)
        end
      end
    end
  end
end
