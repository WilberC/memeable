class UsersController < ApplicationController
  layout 'application'

  def show
    @user = User.find(params[:id])
    render :profile
  end
end
