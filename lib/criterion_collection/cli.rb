class CriterionCollection::CLI 
    def call
        puts "\n Welcome to the Criterion Collection \n".colorize(:yellow)
        @input = ""
        until @input == "exit"
        get_directors
        list_directors
        get_user_director
        get_valid_movie
        circle_back
        end
        farewell
    end

    def get_directors
        puts "Who's Library would you like to peruse?"
        puts "please enter 'Drew' or 'Tom' below:"
        @film_nerd = gets.strip
        if @film_nerd == "Drew"
            CriterionCollection::Director.get_library("https://www.criterion.com/collection/599498")
        elsif @film_nerd == "Tom"
            CriterionCollection::Director.get_library("https://www.criterion.com/collection/325808")
        else
             get_directors
        end
        @directors = CriterionCollection::Director.all
    end

    def list_directors     
        puts "\nHere's a list of Directors in #{@film_nerd}'s library".colorize(:blue)
        @directors.collect {|object| object.name}.uniq.each {|name| puts "#{name}"}
    end

    def get_user_director
        puts "\nEnter a director's name to see availabile Criterion Collection filmography:"
        chosen_director = gets.strip
        if valid_director = valid_input(chosen_director, @directors)
            display_director_movies(valid_director)
        else
                get_user_director
        end
    end


    def display_director_movies(valid_director)
        valid_director.get_movies
        puts "\nMovies by #{valid_director.name}".colorize(:color => :yellow, :background => :blue)
        @movie_choices = valid_director.movies.collect do |movie|
            puts "#{movie.name}"
            movie
        end
    end

    def get_valid_movie
        puts "\nEnter a movie selection to view details:"
        chosen_movie = gets.strip
        if movie = valid_input(chosen_movie, @movie_choices)
            display_movie_details(movie)
        else
            get_valid_movie
        end
    end

    def valid_input(input, data)
        data.detect {|obj| obj.name == input}
    end

    def display_movie_details(movie)
        #@movie_choices.detect do |movie| 
         #   if movie.name.include?(chosen_movie)
                movie.get_movie_details(movie.url, movie)
                puts "\n#{movie.name} was released in #{movie.date} and directed by #{movie.director.name}".colorize(:yellow)
                puts "\n    #{movie.description}\n".colorize(:color => :light_black, :background => :white)
          #  end
        #end
    end


    def reset
        CriterionCollection::Director.all.clear
        CriterionCollection::Movie.all.clear
    end

    def circle_back
        puts "\nWould you like to return to the Main Menu?"
        puts "please enter 'y' to do so or any other key to exit:"
        @input = gets.strip
        if @input == "y"
            reset
            call
        else
            @input = "exit"
        end
    end

    def farewell
        puts "Please be kind, Rewind".colorize(:color => :blue, :background => :yellow)
    end
end