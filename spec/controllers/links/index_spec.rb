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

        it 'renders index template' do
          get :index, tag: 'test'

          expect(assigns(:links)).not_to be_nil

          expect(response).to render_template(:index)
          expect(response.status).to eq 200
        end
      end

      context 'when tag param is not specified' do
        it 'renders index template' do
          get :index, tag: 'test'

          expect(assigns(:links)).not_to be_nil

          expect(response).to render_template(:index)
          expect(response.status).to eq 200
        end
      end
    end
  end
end
