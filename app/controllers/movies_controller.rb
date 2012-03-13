class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  @all_ratings = ['G', 'PG', 'PG-13', 'R']
#  @checked_ratings = {"G"=>"1", "PG"=>"1", "PG-13"=>"1", "R"=>"1"}

  def index

#  @checked_ratings = {"G"=>"1", "PG"=>"1", "PG-13"=>"1", "R"=>"1"}
#    p "initial @checked_ratings = " , @checked_ratings
#    p "Params[:ratings] = ", params[:ratings]

    @hilite_status = params[:id]
    @all_ratings = ['G', 'PG', 'PG-13', 'R']
#    @checked_ratings = params[:ratings]
#    if(param[:commit] == 'Refresh')
       

    if !(params[:ratings] == NIL)
#      p "hello world"
     @checked_ratings = params[:ratings]
#      @checked_ratings = {"G"=>"1", "PG"=>"1", "PG-13"=>"1", "R"=>"1"}
    end 
    p @checked_ratings

    if !(@checked_ratings == NIL) 
      @movies = Movie.where(:rating => @checked_ratings.keys)
    else
      @movies = Movie.all
#      @movies = [] 
    end

    if(params[:id] == "title_header")
#       @movies = Movie.all.sort_by{|x| x.title}
       @movies = @movies.sort_by{|x| x.title}
    elsif(params[:id] == "release_date_header")
#       @movies = Movie.all.sort_by{|x| x.release_date}
       @movies = @movies.sort_by{|x| x.release_date}
#    else
#       @movies = Movie.all
    end
#    if !(@checked_ratings == NIL)
#       @checked_ratings.each {|checked_rating, value|
#         p checked_rating 
#         @movies = @movies.select{|movie| movie.rating == checked_rating}
#      #}
#       @movies = Movie.where(:rating => "PG-13")
#       @movies = Movie.where(["rating IN (?)", @checked_ratings])
#       @movies = Movie.where(:rating => @checked_ratings.keys)
#    end

    #@movies = @movies.select{|movie| movie.rating == "R"}
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
