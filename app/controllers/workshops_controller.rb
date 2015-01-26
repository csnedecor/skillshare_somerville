class WorkshopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def new
    @workshop = Workshop.new()
  end

  def create
    @workshop = current_user.workshops.build(workshop_params)
    if @workshop.save
      flash[:notice] = "Successfully added your workshop!"
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
    @registration = Registration.new()
  end

  def index
    if params[:search]
      @workshops = Workshop.search(params[:search])
    else
      @workshops = Workshop.all
    end
  end

  def edit
    @workshop = current_user.workshops.find(params[:id])
  end

  def update
    @workshop = current_user.workshops.find(params[:id])
    if @workshop.update(workshop_params)
      flash[:notice] = "Successfully updated your workshop!"
      redirect_to workshop_path(@workshop)
    else
      render "edit"
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(:name, :description, :date, :street, :city, :state, :zip, :workshop_pic)
  end

end
