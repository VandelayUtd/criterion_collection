class CriterionCollection::Scraper

    def self.scrape
        site = "https://www.criterion.com/collection/599498"
        page = Nokogiri::HTML(open(site))
        results = page.css(".store-list-of-films.group")
        results.each do |row|
            row.css(".store-row ul.group li").each do |element|
                name = element.css(".filmWrap a .basicFilm figcaption dd").text.lines[1].strip

                #check to see if director exits
                new_director = CriterionCollection::Director.new(name)
                new_director.
            end
        end
    end

    # list = page.css(".store-list-of-films")

    # puts list

end