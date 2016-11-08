# frozen_string_literal: true
class LinkFilter
  def initialize(authenticated:, params:)
    @authenticated = authenticated
    @params = params
  end

  def execute
    links
  end

private

  def links
    if @authenticated
      search_result =
        if @params[:tag].present?
          Link.tagged_with(@params[:tag])
        else
          Link.ransack(@params[:q]).result
        end
      search_result.page(@params[:page]).order('issue_id IS NOT NULL').order(id: :desc)
    else
      search_result = Link.joins(:issue).where.not(issue_id: nil, issues: { sent_at: nil })
      search_result =
        if @params[:tag].present?
          search_result.tagged_with(@params[:tag])
        else
          search_result.ransack(@params[:q]).result
        end
      search_result.page(@params[:page]).order(id: :desc)
    end
  end
end
