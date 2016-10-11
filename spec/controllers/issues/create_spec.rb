describe IssuesController, type: :controller do
  describe 'POST :create' do
    before { sign_in(manager) }

    let(:manager) { create :manager }

    let!(:first_link) { create :link }
    let!(:second_link) { create :link }

    context 'with valid params' do
      it 'creates issue' do
        post :create, issue: {title: '', desc: ''}

        expect(Issue.count).to eq 1

        issue = Issue.first

        expect(issue.title).to eq "Issue ##{issue.id}"
        expect(issue.links).to match_array [first_link, second_link]

        expect(assigns(:issue)).to eq issue

        expect(subject).to redirect_to issues_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      it 'renders form' do
        allow_any_instance_of(Issue).to receive(:save).and_return(false)

        post :create, issue: {title: '', desc: ''}

        expect(subject).to render_template :new
        expect(response.status).to eq 200
      end
    end
  end
end
