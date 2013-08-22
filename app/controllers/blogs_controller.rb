class BlogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @blog = current_user.blog.build(params[:blog])
    if @blog.save
      flash[:success] = "Your blog has been posted."
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

end
