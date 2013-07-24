class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.name.capitalize}! Please complete your profile."
      redirect_to edit_profile_path(current_user)
    else
      render 'new'
    end
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

end
