class CriterionCollection::CLI 
    def call
        puts "\n Welcome to the Criterion Collection Library \n"
        puts "Here's a curated list of directors"
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
       # CriterionCollection::Director.new("Akira Kurosawa")
        CriterionCollection::Scraper.scrape
        #to be scraped instead
        @directors = CriterionCollection::Director.all
       # ["Akira Kurosawa", "Martin Scorsese", "Mike Leigh", "Wes Anderson", "Terrance Malick" ]
    end

    def list_directors
        list = []
        @directors.each {|object| list << object.name}
        unique_list = list.uniq
        unique_list.each {|name| puts "#{name}"}
        # @directors.each do |director|
        #     puts "#{director.name}"
        # end
    end

    def get_user_director
        chosen_director = gets.strip
        display_director_filmography(chosen_director) if @directors.include?(chosen_director)
            #return director filmography
    end

    def display_director_filmography(chosen_director)
        puts "Here are #{chosen_director}'s films"

    end

    # def valid_input(input)
    #     @directors.include?(input)
    # end
end