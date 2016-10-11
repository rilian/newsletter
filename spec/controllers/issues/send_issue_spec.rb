describe IssuesController, type: :controller do
  describe 'POST :send_issue' do
    before { sign_in(manager) }

    let(:manager) { create :manager }
    let(:issue) { create :issue }
    let!(:link) { create :link }
    let!(:subscriber) { create :subscriber }

    context 'when issue is not sent' do
      it 'sends issue' do
        post :send_issue, id: issue.id

        issue.reload
        link.reload

        expect(assigns(:issue)).to eq issue
        expect(issue.sent_at).not_to be_nil
        expect(link.issue_id).to eq issue.id
        expect(ActionMailer::Base.deliveries.count).to eq 1

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'when issue is already sent' do
      it 'redirects to issues' do
        issue.update(sent_at: Time.zone.now)
        post :send_issue, id: issue.id

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'when issue does not exist' do
      it 'redirects to root page with error' do
        post :send_issue, id: 0

        expect(flash[:error]).to eq "Couldn't find Issue with 'id'=0"
        expect(assigns(:issue)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
