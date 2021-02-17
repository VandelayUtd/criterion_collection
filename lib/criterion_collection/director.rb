class CriterionCollection::Director

    attr_accessor :name, :movie, :url, :movies 

    @@all = [] 

    def initialize(name, url)
        @name = name
        @url = url
        @movies = []
        save
    end

    def self.all
        CriterionCollection::Scraper.scrape_directors if @@all.empty?
        @@all
    end

    def get_movies
        CriterionCollection::Scraper.scrape_movies(self, self.url) if @movies.empty?
        
    end

    def save
        @@all << self
    end

end