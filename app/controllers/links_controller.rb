class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(slug: params[:slug],
                        target_url: params[:target_url])

    if @link.save
      redirect_to "/links/#{@link.id}"
    else
      render "/links/new"
    end

  end

  def show
    @link = Link.find_by(id: params[:id])
  end

end
