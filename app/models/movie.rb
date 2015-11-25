class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true
  
  validate :release_date_is_in_the_past

  mount_uploader :poster, PosterUploader

  def review_average
    begin
      reviews.sum(:rating_out_of_ten)/reviews.size
    rescue ZeroDivisionError
      0
    end
  end

  protected

  def self.search(search)
    if search
      puts "Search is #{search.inspect}"
      puts "Search title is #{search['title']}"
      self.where('title LIKE ?', "%#{search['title']}%")
    else
      self.all
    end
  end

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end