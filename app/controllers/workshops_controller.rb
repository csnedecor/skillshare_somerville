class WorkshopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @workshop = Workshop.new()
  end

  def create
    @workshop = current_user.workshops.build(workshop_params)
    if @workshop.save
      flash[:notice] = "Successfully added your class!"
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  private

  def workshop_params
    params.require(:workshop).permit(:name, :description, :date, :street, :city, :state, :zip, :workshop_pic)
  end

end
