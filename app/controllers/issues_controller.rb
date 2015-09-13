class IssuesController < ApplicationController
  before_action :authenticate_manager!, except: %i[index show]

  def index
    @issues = Issue.all.order(id: :desc)
  end

  def show
    @issue = Issue.find(params[:id])

    if @issue.sent_at.blank? && !manager_signed_in?
      redirect_to issues_path and return
    end
  end

  def new
    @links = Link.without_issue.all
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(create_issue_params)
    if @issue.save
      # Assign new Links to the Issue
      Link.without_issue.update_all(issue_id: @issue.id)

      redirect_to issues_path
    else
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update(update_issue_params)
      redirect_to issues_path
    else
      render :edit
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    redirect_to issues_path
  end

  def send_issue
    @issue = Issue.find(params[:id])
    redirect_to issues_path and return if @issue.sent_at.present?

    # Assign new Links to the Issue
    Link.without_issue.update_all(issue_id: @issue.id)

    Subscriber.active.each do |subscriber|
      IssueMailer.notify_subscribers(issue: @issue, subscriber: subscriber).deliver_now
    end

    @issue.update(sent_at: Time.zone.now)

    redirect_to issues_path
  end

private

  def create_issue_params
    params.require(:issue).permit(:title, :desc)
  end

  def update_issue_params
    params.require(:issue).permit(:title, :desc)
  end
end
