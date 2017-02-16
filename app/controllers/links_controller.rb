class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.links
    render "index.html.erb"
  end

  def new
    @link = Link.new
    render "new.html.erb"
  end

  def create
    @link = Link.new(user_id: current_user.id,
                      slug: params[:slug],
                      target_url: params[:target_url],
                    )
    @link.standardize_target_url!
    if @link.save
      flash[:success] = "Congrats for adding another link to the list!!"
      redirect_to "/links" 
    else
      render "new.html.erb"
    end
  end

  def show
    if current_user
      @link = Link.find_by(id: params[:id])
      render "show.html.erb"
    else 
      redirect_to "/links"
    end 
  end

  def edit
    if current_user
      @link = Link.find_by(id: params[:id])
      render "edit.html.erb"
    else
      redirect_to "/links"
    end 
  end

  def update
    if current_user
      @link = Link.find_by(id: params[:id])
      @link.assign_attributes(slug: params[:slug], target_url: params[:target_url])
      @link.save
      redirect_to "/links"
    end 
  end

  def destroy
    if current_user
      @link = Link.find_by(id: params[:id])
      @link.destroy
      redirect_to "/links"
      flash[:success] = "you have deleted the link"
    end 
  end

end
