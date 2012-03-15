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
#    p "check_rating(", rating, @checked_ratings
    if(@checked_ratings == NIL)
#       if(@check_all == true) 
#          return true;
#       else
#          return false;
#       end
        return false;
    elsif(@checked_ratings[rating] == "1")
       return true;
    else
       return false;
    end
  end
end
