describe IssuesController, type: :controller do
  describe 'DELETE :destroy' do
    before { sign_in manager }

    let(:issue) { create :issue }
    let(:manager) { create :manager }

    context 'when issue exists' do
      it 'deletes issue' do
        delete :destroy, id: issue.id

        expect(Issue.count).to eq 0

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'when issue does not exist' do
      it 'redirects to root page with error' do
        delete :destroy, id: 0

        expect(flash[:error]).to eq "Couldn't find Issue with 'id'=0"
        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
