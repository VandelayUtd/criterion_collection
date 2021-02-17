class CriterionCollection::Movie
    attr_reader :name, :director, :url
    attr_accessor :description, :date
    @@all = []

    def initialize(name, director, url)
        @name = name
        @url = url
        @director = director
        @date = date
        @description = description
        add_to_director
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all << self
    end

    def add_to_director
        @director.movies << self 
        #unless @director.movies.include?(self)
    end

    def get_movie_details(url, movie)
        CriterionCollection::Scraper.scrape_movie_details(url, movie)
    end

end