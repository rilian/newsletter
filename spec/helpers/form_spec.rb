describe FormHelper do
  describe 'edit_form_label' do
    it 'generates label for create model form' do
      expect(edit_form_label(Manager.new)).to eq 'Create Manager'
    end

    it 'generates label for update model form' do
      allow_any_instance_of(Manager).to receive(:persisted?).and_return(true)
      expect(edit_form_label(Manager.new)).to eq 'Update Manager'
    end
  end
end
