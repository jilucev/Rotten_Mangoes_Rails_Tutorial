class Movie < ActiveRecord::Base
  # def review_average
  #   return nil if reviews.size == 0
  #   reviews.sum(:rating_out_of_ten) / reviews.size
  # end
end
