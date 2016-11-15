# frozen_string_literal: true
describe IssuesController, type: :controller do
  describe 'PATCH :update' do
    before { sign_in(manager) }

    let(:manager) { create :manager }
    let(:issue) { create :issue }

    context 'with valid params' do
      it 'updates issue' do
        patch :update, params: { id: issue.id, issue: { desc: 'Test' } }

        issue.reload

        expect(issue.desc).to eq 'Test'
        expect(assigns(:issue)).to eq issue

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      before do
        allow_any_instance_of(Issue).to receive(:update).and_return(false)
      end

      it 'renders form' do
        post :update, params: { id: issue.id, issue: { title: '', desc: '' } }

        expect(subject).to render_template :edit
        expect(response.status).to eq 200
      end
    end

    context 'when issue does not exist' do
      it 'redirects to root page with error' do
        patch :update, params: { id: 0 }

        expect(flash[:error]).to eq "Couldn't find Issue with 'id'=0"
        expect(assigns(:issue)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
