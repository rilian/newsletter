describe ApplicationHelper do
  describe '.flash_class' do
    it 'returns proper class for flash type' do
      expect(flash_class(:notice)).to eq ''
      expect(flash_class(:error)).to eq 'flash-error'
      expect(flash_class(:alert)).to eq 'flash-warn'
    end
  end

  describe 'sidemenu_link_to' do
    let(:text) { 'text' }
    let(:path) { 'links' }

    before do
      allow(self).to receive(:current_page?).and_return(true)
    end

    context 'without icon param' do
      let(:options) { {} }

      it 'returns link' do
        expect(sidemenu_link_to(text, path, options)).to eq link_to(text, path, options)
      end
    end

    context 'with icon param' do
      let(:options) { {icon: 'link'} }
      let(:expected_result) do
        link_to(path, options) do
          "<span class='octicon octicon-#{options[:icon]}'></span>#{text}".html_safe
        end
      end

      it 'returns link' do
        expect(sidemenu_link_to(text, path, options)).to eq expected_result
      end
    end
  end
end
