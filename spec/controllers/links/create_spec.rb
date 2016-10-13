# frozen_string_literal: true
describe LinksController, type: :controller do
  describe 'POST :create' do
    before { sign_in(manager) }

    let(:manager) { create :manager }

    context 'with valid params' do
      it 'creates link' do
        post :create, link: { url: 'example.com' }

        expect(Link.count).to eq 1

        link = Link.first
        expect(link.url).to eq 'example.com'

        expect(assigns(:link)).to eq link

        expect(subject).to redirect_to links_path
        expect(response.status).to eq 302
      end
    end

    context 'with invalid params' do
      it 'does not create link' do
        post :create, link: { url: nil }

        expect(Link.count).to eq 0

        expect(assigns(:link).new_record?).to eq true
        expect(assigns(:link).errors.full_messages).to include "Url can't be blank"

        expect(subject).to render_template :new
        expect(response.status).to eq 200
      end
    end
  end
end
