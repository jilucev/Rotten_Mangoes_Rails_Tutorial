class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  def review_average
    #return nil if reviews.empty?
    if  reviews.sum(:rating_out_of_ten) / reviews.size == 0
      render :new
    else
      reviews.sum(:rating_out_of_ten) / reviews.size
    end
  end
  #the above method was a creative guess!

#we can access this method anywhere (movies index, movies show....) so just add this
#erb any time you want to display the average: <%= @movie.review_average %> /10

  protected

  def release_date_is_in_the_future
    if release_date.present? && release_date < Date.today
      errors.add(:release_date, "should probably be in the future")
    end
  end

end
