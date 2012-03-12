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
end
