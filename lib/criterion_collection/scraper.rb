class CriterionCollection::Scraper

    def self.scrape_directors
        site = "https://www.criterion.com/collection/599498"
        page = Nokogiri::HTML(open(site))
        results = page.css(".store-list-of-films.group")
        results.each do |row|
            row.css(".store-row ul.group li").each do |element|
                name = element.css(".filmWrap a .basicFilm figcaption dd").text.lines[1].strip
                
                ## Retrieves the director filmography link
                #moves to movie page
                #movie_page = Nokogiri::HTML(open(element.css(".filmWrap a").attribute("href").value))
                #retrieves director link from the movie page
                #partial_director_url = movie_page.css("p.header_lvl2 a").attribute("href").value

                names = name.downcase.split
                last = names.pop
                first = names.join(" ").delete(".")
                name_ext = "/shop/browse?director=#{last} #{first}".gsub(" ", "-")
                url = "https://www.criterion.com#{name_ext}"
                
               
                CriterionCollection::Director.new(name, url)

                #CriterionCollection::Director.all.detect{|object| object.name != name}
                
            end
        end
    end

    def self.scrape_movies(director, director_url)
        #site = "https://www.criterion.com/collection/599498"
        page = Nokogiri::HTML(open(director_url))
        results = page.css(".store-list-of-films.group")
        results.each do |row|
            row.css(".store-row ul.group li").each do |element|
                    name = element.css(".filmWrap a .basicFilm figcaption dt").text.lines[1].strip
                    movie_url = element.css(".filmWrap a").attribute("href").value
                    CriterionCollection::Movie.new(name, director, movie_url)
            end
        end
    end

    def self.scrape_movie_details(url, movie)
        page = Nokogiri::HTML(open(url))
        movie.description = page.css(".product-summary p").text.strip
        movie.date = page.css(".film-meta-list li").text.lines[3].strip[0..3]

    end
end