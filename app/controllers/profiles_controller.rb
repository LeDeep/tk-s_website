class ProfilesController < ApplicationController
  
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:success] = "You have successfully updated your profile!"
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def index
    @profile = Profile.all
  end
end
