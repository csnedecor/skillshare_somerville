class WorkshopsController < ApplicationController
  def new
    workshop = Workshop.new()
  end

  def show
    workshop = Workshop.find(params[:id])
  end
  
end
