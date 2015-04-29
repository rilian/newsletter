class ManagersController < ApplicationController
  def index
    @managers = Manager.all
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(create_manager_params)
    if @manager.save
      redirect_to managers_path
    else
      render :new
    end
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    if @manager.update(update_manager_params)
      redirect_to managers_path
    else
      render :edit
    end
  end

  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy
    redirect_to managers_path
  end

private

  def create_manager_params
    params.require(:manager).permit(:email)
  end

  def update_manager_params
    params.require(:manager).permit(:email)
  end
end
