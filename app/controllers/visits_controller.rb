class VisitsController < ApplicationController
  def show
    @link = Link.find(params[:id])
    redirect_to '/links' if @link.user_id != current_user.id

    unless @link
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
