class CriterionCollection::Movie
    attr_reader :name, :director, :url
    @@all = []

    def initialize(name, director, url)
        @name = name
        @url = url
        @director = director
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

end