class InvitationsController < ApplicationController
  def new
    @flock = Flock.find(params[:flock_id])
    authorize! :manage, @flock
  end

  def create
  end
end
