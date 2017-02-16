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
    @link = link.find_by(slug: params[:slug])
    puts @link
    redirect_to "#{@link.target_url}"
  end

end
