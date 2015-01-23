class StaticPagesController < ApplicationController
  def home
    @task = current_user.tasks.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def help
  end
end
