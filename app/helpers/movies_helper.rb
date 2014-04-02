module MoviesHelper

  def formatted_date(date)
    date.strftime("%b %d, %y")
  end
end

#now whrever we display our release_date, we can formit it by replacing the old 
#code with: <%= formatted_date(@movie.release_date) %>
# A useful web app for strftime formatting: http://www.foragoodstrftime.com/