class VisitsController < ApplicationController

  def create
    @visit = Link.find_by(slug: params[:slug])[:target_url]
    redirect_to "#{@visit}"
  end

end
