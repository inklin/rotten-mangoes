class User < ActiveRecord::Base
  
  has_many :reviews
  has_secure_password

  validates :admin, inclusion: { in: [true, false] }
  validates :email, presence: true, uniqueness: true
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

  def full_name
    "#{firstname} #{lastname}"
  end

end
