# require 'nokogiri'
# require 'open-uri'

class Top100Scary::Scraper

    #instance method that initializes a single movie at a time
    def movie_initializer
        new_movie = Top100Scary::Movie.new
    end

    def initialize #instance method that initializes top 100 movies
        y = 0
        all_movies = []
        while y < 100
        new_movie = Top100Scary::Movie.new(y)
        all_movies << new_movie
        y += 1
        end
        all_movies
    end

    #-------------------------------------------------------------------

    #list of methods that access the dta on the IMDB HTML
    def self.index_page #allows access to HTML
        html = "https://www.imdb.com/list/ls062655785/"
        Nokogiri::HTML(open(html))
    end

    #generates selected movies IMDB page URL
    def movie_url(selected_movie)
        index = selected_movie.index
        resource = self.class.index_page.css(".lister-item-header a")[index]["href"]
	    movie_url = "https://www.imdb.com" + resource
    end

    #retrieves NokoGiri data from selected movies IMDB page
    def movie_page(selected_movie)
        movie_html = movie_url(selected_movie)
        Nokogiri::HTML(open(movie_html))
    end

    #generates NokokGiri data from selected movies IMDB page
    def trivia_url(selected_movie)
        movie_page = movie_page(selected_movie)
        movie_url = movie_url(selected_movie)
        resource = movie_page.css("div#trivia a.nobr")[0]["href"].to_s
        trivia_url = movie_url.to_s + resource
    end

    #retreives Nokogiri data from selected movie IMDB trivia page
    def trivia_page(selected_movie) 
        trivia_html = trivia_url(selected_movie)
        Nokogiri::HTML(open(trivia_html))
    end

    #generates Nokogiri data from selecteed movie IMDB qotes page
    def quotes_url(selected_movie) 
        movie_page = movie_page(selected_movie)
        movie_url = movie_url(selected_movie)
        resource = movie_page.css("div#quotes a.nobr")[0]["href"].to_s
        quotes_url = movie_url.to_s + resource
    end

    #retrieves Nokogiri data from selected movie IMDB  trivia page
    def quotes_page(selected_movie) 
        quotes_html = quotes_url(selected_movie)
        Nokogiri::HTML(open(quotes_html))
    end

    #Prints an array of the top 100 scary movies from IMDB index page
    def self.print_movie_list
        all_titles = []
        i = 1
        self.index_page.css("h3.lister-item-header a").each {|title| 
            all_titles << "#{i}. #{title.text.strip}"
            i+=1
         }
        puts all_titles
    end
end