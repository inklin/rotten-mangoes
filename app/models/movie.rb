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
    @movies = all
    if search
      @movies = @movies.search_keyword(search[:keyword]) unless search[:keyword].blank?

      unless search[:duration].blank?
        duration = duration_min_max(search[:duration])
        @movies = @movies.runtime_longer_than(duration[:min]) if duration[:min]
        @movies = @movies.runtime_shorter_than(duration[:max]) if duration[:max]
      end
    end
    @movies
  end

  def self.search_keyword(keyword)
    where('title LIKE :word or director LIKE :word', { word: "%#{keyword}%" })
  end

  def self.runtime_longer_than(min_time)
    where('runtime_in_minutes > ? ', min_time)
  end

  def self.runtime_shorter_than(max_time)
    where('runtime_in_minutes < ? ', max_time)
  end

  def self.duration_min_max(duration_string)
    duration_array = duration_string.split('-')
    { min: duration_array[0], max: duration_array[1] }
  end

  private

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end