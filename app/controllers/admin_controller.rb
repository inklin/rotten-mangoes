class AdminController < ApplicationController

  before_action :require_admin

  def require_admin
    unless current_user.try(:admin?)
      flash[:notice] = "You must be an admin to access the User Management page."
      redirect_to root_path
    end
  end
end