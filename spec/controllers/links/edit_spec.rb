# frozen_string_literal: true
describe LinksController, type: :controller do
  describe 'GET :edit' do
    before { sign_in manager }

    let(:link) { create :link }
    let(:manager) { create :manager }

    context 'when link exists' do
      it 'returns link edit page' do
        get :edit, id: link.id

        expect(assigns(:link)).to eq link

        expect(subject).to render_template :edit
        expect(response.status).to eq 200
      end
    end

    context 'when link does not exist' do
      it 'redirects to root page with error' do
        patch :update, id: 0

        expect(flash[:error]).to eq "Couldn't find Link with 'id'=0"
        expect(assigns(:link)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
