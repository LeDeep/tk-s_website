class StaticPagesController < ApplicationController
  def home
    @blog = current_user.blogs.build if signed_in?
  end

  def about
  end

  def contact
  end
end
