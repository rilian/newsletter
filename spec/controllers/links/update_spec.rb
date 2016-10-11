describe LinksController, type: :controller do
  describe 'PATCH :update' do
    before { sign_in(manager) }

    let(:manager) { create :manager }
    let(:link) { create :link, {url: 'example.com' } }

    context 'with valid params' do
      it 'updates link' do
        patch :update, id: link.id, link: { url: 'other_example.com' }

        link.reload
        expect(link.url).to eq 'other_example.com'

        expect(assigns(:link)).to eq link

        expect(subject).to redirect_to links_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      it 'does not update link' do
        patch :update, id: link.id, link: { url: nil }

        link.reload
        expect(link.url).to eq 'example.com'

        expect(assigns(:link)).to eq link
        expect(assigns(:link).errors.full_messages).to include("Url can't be blank")

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
