module MoviesHelper

  DURATION_OPTIONS = {
    'Under 90 min' => "0-90",
    'Between 90 and 120 min' => "90-120",
    'Over 120 min' => "120"
  }

  def formatted_date(date)
    date.strftime("%b %d, %Y")
  end

end
