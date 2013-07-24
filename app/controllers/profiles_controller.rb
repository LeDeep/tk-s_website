class ProfilesController < ApplicationController
  
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
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
