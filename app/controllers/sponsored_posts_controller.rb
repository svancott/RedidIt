class SponsoredPostsController < ApplicationController
  def index
    @sponsored_posts = SponsoredPost.all
  end

  def show
     @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new
     @sponsored_post.title = params[:sponsored_post][:title]
     @sponsored_post.body = params[:sponsored_post][:body]
     @sponsored_post.price = params[:sponsored_post][:price]

     if @sponsored_post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @sponsored_post]
      else
        flash.now[:alert] = "There was an error saving the post. Please try again."
        render :new
      end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]

    if @sponsored_post.save
      flash[:notice] = "Post was updated"
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end
