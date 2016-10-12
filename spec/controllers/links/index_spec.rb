# frozen_string_literal: true
describe LinksController do
  describe 'GET index' do
    let(:manager) { create :manager }

    context 'with authentication' do
      context 'when tag param specified' do
        before do
          sign_in(manager)
        end

        it 'renders index template' do
          get :index, tag: 'test'

          expect(response).to render_template(:index)
          expect(response.status).to eq 200
        end
      end
    end

    context 'without authentication' do
      context 'when tag param specified' do
        let!(:first_link) { create(:link, tag_list: %w[tag first_tag]) }
        let!(:second_link) { create(:link, tag_list: %w[tag second_tag]) }
        let!(:issue) { create :issue }

        before do
          Link.without_issue.update_all(issue_id: issue.id)
          issue.update(sent_at: Time.zone.now)
        end

        it 'renders search_by_tag template' do
          get :index, tag: 'first_tag'

          expect(assigns(:links)).to include first_link
          expect(assigns(:links)).not_to include second_link

          expect(response).to render_template(:search_by_tag)
          expect(response.status).to eq 200
        end
      end

      context 'when tag param is not specified' do
        it 'redirects to login page' do
          get :index

          expect(subject).to redirect_to new_manager_session_path
          expect(response.status).to eq 302
        end
      end
    end
  end
end
