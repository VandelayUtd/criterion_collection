class CriterionCollection::Director

    attr_accessor :name

    @@all = [] 
    #["Akira Kurosawa", "Martin Scorsese", "Mike Leigh", "Wes Anderson", "Terrance Malick" ]

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end



end