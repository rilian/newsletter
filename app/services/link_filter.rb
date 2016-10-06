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
        Link.where.not(issue_id: nil)
          .joins(:issue).where.not(issues: { sent_at: nil })
          .tagged_with(@params[:tag])
          .page(@params[:page]).order(id: :desc)
      else
        []
      end
    end
  end
end
