describe IssuesController, type: :controller do
  describe 'GET :show' do
    let(:manager) { create :manager }

    let(:issue) { create :issue }

    context 'with authentication' do
      it 'shows issue page' do
        sign_in manager

        get :show, id: issue.id

        expect(assigns(:issue)).to eq issue

        expect(subject).to render_template :show
        expect(response.status).to eq 200
      end
    end

    context 'without authentication' do
      context 'with sent issue' do
        it 'shows sent issue' do
          issue.update(sent_at: Time.zone.now)

          get :show, id: issue.id

          expect(assigns(:issue)).to eq issue

          expect(subject).to render_template :show
          expect(response.status).to eq 200
        end
      end

      context 'with not sent issue ' do
        it 'does not show not sent issue' do
          get :show, id: issue.id

          expect(subject).to redirect_to issues_path
          expect(response.status).to eq 302
        end
      end
    end

    context 'when issue does not exist' do
      it 'redirects to root page with error' do
        sign_in manager

        post :send_issue, id: 0

        expect(flash[:error]).to eq "Couldn't find Issue with 'id'=0"
        expect(assigns(:issue)).to eq nil

        expect(subject).to redirect_to root_url
        expect(response.status).to eq 302
      end
    end
  end
end
