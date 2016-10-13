# frozen_string_literal: true
module FormHelper
  def edit_form_label(what = nil)
    action = what.respond_to?(:persisted?) && what.persisted? ? 'Update' : 'Create'
    "#{action} #{what.class}"
  end
end
