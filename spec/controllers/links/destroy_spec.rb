describe LinksController, type: :controller do
  describe 'DELETE :destroy' do
    before { sign_in manager }

    let(:link) { create :link }
    let(:manager) { create :manager }

    context 'when link exists' do
      it 'deletes link' do
        delete :destroy, id: link.id

        expect(Link.count).to eq 0

        expect(subject).to redirect_to links_path
        expect(response.status).to eq 302
      end
    end

    context 'when link does not exist' do
      it 'redirects to root page with error' do
        delete :destroy, id: 0

        expect(Link.count).to eq 0

        expect(flash[:error]).to eq "Couldn't find Link with 'id'=0"
        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
