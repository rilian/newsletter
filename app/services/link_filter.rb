# frozen_string_literal: true
class LinkFilter
  def initialize(authenticated:, params:)
    @authenticated = authenticated
    @params = params
  end

  def execute
    get_links
  end

private

  def get_links
    if @authenticated
      search_result =
        if @params[:tag].present?
          Link.tagged_with(@params[:tag])
        else
          Link.ransack(@params[:q]).result
        end
      search_result.page(@params[:page]).order('issue_id IS NOT NULL').order(id: :desc)
    else
      if @params[:tag].present?
        Link
          .joins(:issue)
          .where.not(issue_id: nil, issues: { sent_at: nil })
          .tagged_with(@params[:tag])
          .page(@params[:page])
          .order(id: :desc)
      else
        Link.none
      end
    end
  end
end
