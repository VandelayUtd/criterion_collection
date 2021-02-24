class CriterionCollection::Director

    attr_accessor :name, :url, :movies 

    @@all = [] 

    def initialize(name, url)
        @name = name
        @url = url
        @movies = []
        save
    end

    def self.all
        @@all
    end

    def self.get_library(site)
        CriterionCollection::Scraper.scrape_directors(site)
    end

    def get_movies
        CriterionCollection::Scraper.scrape_movies(self, self.url) if @movies.empty?      
    end

    def save
        @@all << self
    end

end