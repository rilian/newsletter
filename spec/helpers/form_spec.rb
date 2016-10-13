# frozen_string_literal: true
describe FormHelper do
  describe 'edit_form_label call' do
    context 'from create model form' do
      it 'generates label' do
        expect(edit_form_label(Manager.new)).to eq 'Create Manager'
      end
    end

    context 'from update model form' do
      before do
        allow_any_instance_of(Manager).to receive(:persisted?).and_return(true)
      end

      it 'generates label' do
        expect(edit_form_label(Manager.new)).to eq 'Update Manager'
      end
    end
  end
end
