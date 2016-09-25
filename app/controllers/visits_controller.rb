class VisitsController < ApplicationController
  def create
    @link = Link.find_by(slug: params[:slug])
    @ip_address = request.remote_ip

    if @link
      Visit.create(link_id: @link.id)
      redirect_to "http://#{@link.target_url}"
    else
      raise ActionController::RoutingError.new('Not Found')
    end   
  end
end
