class RegistrationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def create
    @registration = Registration.find_or_initialize_by(:workshop_id => params[:workshop_id])
    @registration.user = current_user
    if @registration.save
      flash[:notice] = "Successfully registered!"
      redirect_to workshop_path(@registration.workshop)
    else
      render "workshops/show"
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    flash[:notice]= "You are no longer registered for that class"
    redirect_to workshop_path(params[:workshop_id])
  end
end
