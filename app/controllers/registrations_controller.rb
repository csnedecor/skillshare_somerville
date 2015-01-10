class RegistrationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def create
    @registration = Registration.new(:workshop_id => params[:workshop_id])
    @registration.user = current_user
    if @registration.save
      flash[:notice] = "Successfully registered!"
      redirect_to workshop_path(@registration.workshop)
    else
      render "workshops/show"
    end
  end

end
