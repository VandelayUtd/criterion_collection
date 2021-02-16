class CriterionCollection::CLI 
    def call
        puts "\n Welcome to the Criterion Collection Library \n"
        puts "Here's a curated list of some of our favorite directors"
        puts "Each one of them has made a notable contribution to modern day cinema"
        #gets and displays a list of directors
        get_directors
        list_directors
        puts "Enter director's name to see availabile Criterion Collection filmography:"
        get_user_director
        
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
        valid_director.get_movies
        puts "Here are movies directed by #{valid_director.name}"
        valid_director.movies.each do |object|
            puts "#{object.name}"
        end
    end

    # def valid_input(input)
    #     @directors.include?(input)
    # end
end