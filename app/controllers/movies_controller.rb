class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  @all_ratings = ['G', 'PG', 'PG-13', 'R']

  def index

    @check_all = true;
    @hilite_status = params[:id]
    @all_ratings = ['G', 'PG', 'PG-13', 'R']

    #p @checked_ratings = params[:ratings]
    @need_to_redirect = false
    p session[:id]
    p session[:commit]
    p session[:ratings
]
    if(params[:id] == NIL and session[:id] != NIL)
       params[:id] = session[:id]
    end
    if(params[:commit] == NIL and session[:commit] != NIL)
       params[:commit] = session[:commit]
       @need_to_redirect = true
    end
    if(params[:ratings] == NIL and session[:ratings] != NIL)
       params[:ratings] = session[:ratings]
       @need_to_redirect = true
    end
    if(@need_to_redirect == true)
       @need_to_redirect = false
       redirect_to movies_path(params)
    end

    if(params[:commit] == 'Refresh' or params[:id] == "title_header" or params[:id] == "release_date_header")
       @check_all = false
       @checked_ratings = params[:ratings]
    else
       @check_all = true
       @checked_ratings = {"G"=>"1", "PG"=>"1", "PG-13"=>"1", "R"=>"1"}
    end




    if (@checked_ratings == NIL)
       @movies = []
    else
       @movies = Movie.where(:rating => @checked_ratings.keys)
#    elsif(@check_all == true)
#       @movies = Movie.all
    end

    if (params[:id] == "title_header")
       @movies = @movies.sort_by{|x| x.title}
    elsif(params[:id] == "release_date_header")
       @movies = @movies.sort_by{|x| x.release_date}
    end

    session[:id] = params[:id]
    session[:commit] = params[:commit]
    session[:ratings] = params[:ratings]




#    if  (@check_all == true)
#       @movies = Movie.all
#    elsif (params[:id] == "title_header")
#       @movies = @movies.sort_by{|x| x.title}
#    elsif (params[:id] == "release_date_header")
#       @movies = @movies.sort_by{|x| x.release_date}
#    else
#       @movies = []
#    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
