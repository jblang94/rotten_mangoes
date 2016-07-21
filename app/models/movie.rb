class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :release_date, presence: true

  validate :release_date_is_in_the_past

  mount_uploader :poster, PosterUploader

  scope :title_or_director,  -> (search) { where('title LIKE :search OR director LIKE :search', search: "%#{search}%") }
  scope :under_ninety_min, -> { where('runtime_in_minutes < 90') }
  scope :between_ninety_and_hundred_twenty_min, -> { where('runtime_in_minutes BETWEEN 90 AND 120') }
  scope :over_hundred_twenty_min, -> { where('runtime_in_minutes > 120') }

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
