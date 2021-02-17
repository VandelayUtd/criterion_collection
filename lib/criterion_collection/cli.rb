class CriterionCollection::CLI 
    def call
        puts "\n Welcome to the Criterion Collection Library \n"
        puts "Here's a curated list of some of our favorite directors"
        puts "Each one of them has made a notable contribution to modern day cinema"
        #gets and displays a list of directors
        get_directors
        list_directors
        puts "Enter director's name to see availabile Criterion Collection filmography:"
        #gets user input and returns a list of chosen director's films
        get_user_director
        puts "Select a movie to view details"
        show_movie_details
        puts "\nWould you like to go back to the director list?"
        puts "Enter 'y' for yes or any other key to exit"
        circle_back

        
        #get_movies_for(director)
        #list_movies

    end

    def get_directors
       ## move this to director class
        # CriterionCollection::Scraper.scrape_directors
        @directors = CriterionCollection::Director.all
       
    end

    def list_directors
        list = []
        @directors.each {|object| list << object.name}
        unique_list = list.uniq
        unique_list.each {|name| puts "#{name}"}
    end

    def get_user_director
        chosen_director = gets.strip
        valid_director = valid_input(chosen_director)
        display_director_movies(valid_director)
    end

    def valid_input(input)
        @directors.detect{|director| director.name == input}
    end


    def display_director_movies(valid_director)
        @movie_choices = []
        valid_director.get_movies
        puts "Here are movies directed by #{valid_director.name}"
        valid_director.movies.each do |movie|
            puts "#{movie.name}"
            @movie_choices << movie
        end
    end

    def show_movie_details
        chosen_movie = gets.strip
        display_movie_details(chosen_movie)
    end

    def display_movie_details(chosen_movie)
        @movie_choices.detect do |movie| 
            if movie.name.include?(chosen_movie)
                movie.get_movie_details(movie.url, movie)
                puts "\n#{movie.name} was released in #{movie.date} and directed by #{movie.director.name}\n"
                puts "\n    #{movie.description}\n"
            end
        end
    end

    def circle_back
        input = gets.strip
        if input == "y"
            call 
        end
    end

    # def valid_input(input)
    #     @directors.include?(input)
    # end
end