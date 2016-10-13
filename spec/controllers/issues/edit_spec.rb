# frozen_string_literal: true
describe IssuesController, type: :controller do
  describe 'GET :edit' do
    before { sign_in manager }

    let(:issue) { create :issue }
    let(:manager) { create :manager }

    context 'when issue exists' do
      it 'returns issue edit page' do
        get :edit, id: issue.id

        expect(assigns(:issue)).to eq issue

        expect(subject).to render_template :edit
        expect(response.status).to eq 200
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
