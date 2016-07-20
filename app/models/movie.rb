class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :release_date, presence: true

  validate :release_date_is_in_the_past

  mount_uploader :poster, PosterUploader

  def self.search(title_search, director_search)
    return Movie.all if title_search.blank? && director_search.blank?
    Movie.where('title LIKE ? AND director LIKE ?', "%#{title_search}%", "%#{director_search}%")
  end

  def review_average
    return 0 if reviews.size == 0
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
