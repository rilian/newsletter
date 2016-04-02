class LinksController < ApplicationController
  before_action :authenticate_manager!

  def index
    @q = Link.ransack(params[:q])
    @links = @q.result.page(params[:page]).order('issue_id IS NOT NULL').order(id: :desc)
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

  LINK_PARAMS = %i[url desc title time_to_read]
  STORE_PARAMS = %i[manager_id issue_id] + LINK_PARAMS

  def new_link_params
    params.require(:link).permit(LINK_PARAMS)
  end

  def create_link_params
    params.require(:link).permit(STORE_PARAMS)
  end

  def update_link_params
    params.require(:link).permit(STORE_PARAMS)
  end
end
