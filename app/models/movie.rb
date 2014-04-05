class Movie < ActiveRecord::Base

  has_many :reviews

  mount_uploader :poster, PosterUploader


  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  # validates :poster_image_url,
  #   presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  # def self.ordered_by_release_date
  #   order(release_date: :desc, title: :asc)
  # end

  # scope :ordered_by_release_date, -> { order(release_date: :desc, title: :asc) }
  # #a lambda passes business logic to a method. This is common when using active record.
  # #in ruby 1.9 and later, the arrow can replace the word 'lambda'.

  scope :with_director, -> ( director ) do
    where(director: director)
  end

  scope :matching_title, -> (title) do
    where("title like?", "%#{ title }%")
  end


  def self.search_by_runtime(min, max)
     self.where("runtime_in_minutes BETWEEN ? AND ?", min, max)
  end


  def review_average
    #return nil if reviews.empty?

    if reviews.empty?
      return 0
    else
    reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end
 

  protected

  def release_date_is_in_the_future
    if release_date.present? && release_date < Date.today
      errors.add(:release_date, "should probably be in the future")
    end
  end

end
