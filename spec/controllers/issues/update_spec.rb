describe IssuesController, type: :controller do
  describe 'PATCH :update' do
    before { sign_in(manager) }

    let(:manager) { create :manager }
    let(:issue) { create :issue }

    context 'with valid params' do
      it 'updates issue' do
        patch :update, id: issue.id, issue: { desc: 'Test' }

        issue.reload
        expect(issue.desc).to eq 'Test'

        expect(assigns(:issue)).to eq issue

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'when issue does not exist' do
      it 'redirects to root page with error' do
        patch :update, id: 0

        expect(flash[:error]).to eq "Couldn't find Issue with 'id'=0"
        expect(assigns(:issue)).to eq nil
        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
