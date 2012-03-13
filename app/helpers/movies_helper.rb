module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def th_hilite?(arg)
    if(arg == @hilite_status)
      return "hilite";
    else
      return NIL;
    end
  end
  def check_rating(rating)
    p "check_rating(", rating, @checked_ratings
    if(@checked_ratings == NIL)
       @checked_ratings = {"G" => "1", "PG" => "1", "PG-13" => "1", "R" => "1"}
       return true;
    elsif(@checked_ratings[rating] == "1")
       return true;
    else
       return false;
    end
  end
end
