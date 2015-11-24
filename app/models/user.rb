class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { in: 6..20}, on: :create

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id # Auto Login the user
      redirect_to movies_path
    else
      render :new
    end
  end
end
