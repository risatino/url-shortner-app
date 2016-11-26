class LinksController < ApplicationController
  def index
    @links = current_user.current_links
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(user_id: current_user.id,
                     target_url: params[:target_url])

    @link.generate_slug
    @link.standardize_target_url!
    @link.save
    redirect_to "/links"
    flash[:success] = "Link shortened!"
  end

  def show
    @link = Link.where('slug LIKE ?', params[:slug])

    Visit.create(link_id: @link.first.id, ip_address: request.remote_ip)

    redirect_to @link.first.target_url
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(user_id: current_user.id,
                 target_url: params[:target_url],
                 slug: params[:slug])

    redirect_to '/links'
    flash[:success] = "Link updated"
  end

  def destroy
    @link = Link.find(params[:id])

    flash[:warning] = "Link deleted."

    @link.destroy

    redirect_to '/links'
  end
end
