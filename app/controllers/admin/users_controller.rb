class Admin::UsersController < AdminController

  def index
    @users = User.order(:firstname).page(params[:page]).per(10)
  end

end