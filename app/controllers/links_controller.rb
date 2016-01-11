class LinksController < ApplicationController
  before_action :authenticate_manager!

  def index
    @links = Link.all.order('issue_id IS NOT NULL').order(id: :desc)
  end

  def new
    @link =
      if params[:link].present?
        Link.new(new_link_params)
      else
        Link.new
      end
  end

  def create
    @link = Link.new(create_link_params)
    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(update_link_params)
      redirect_to links_path
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_path
  end

private

  def new_link_params
    params.require(:link).permit(:url, :desc, :title)
  end

  def create_link_params
    params.require(:link).permit(:manager_id, :issue_id, :url, :desc, :title)
  end

  def update_link_params
    params.require(:link).permit(:manager_id, :issue_id, :url, :desc, :title)
  end
end
