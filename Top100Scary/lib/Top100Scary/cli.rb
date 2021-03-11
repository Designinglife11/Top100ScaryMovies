class Top100Scary::CLI

    #start is the CLI instance method that the user interacts with
  def start
    puts "Top 100 Scary Movies:"
    Top100Scary::Scraper.print_movie_list
    scraper = Top100Scary::Scraper.new
    user_input = "y"
    while user_input == "y"
        movie = scraper.movie_initializer
        movie.print_details
        puts "Would you like to learn more about #{movie.title}?"
        puts "Please type 'y' for yes or 'n' for no."
        user_input = gets.strip.downcase
        while user_input == 'y'
            movie.ask_user
            user_input = gets.strip.to_i
            if user_input == 1
              movie.print_tagline
            elsif user_input == 2
              movie.print_plot
            elsif user_input == 3
              movie.print_trivia
            elsif user_input == 4
              movie.print_quotes
            elsif user_input == 5
              movie.print_cast
            end

            puts "Would you like to know more about #{movie.title}?"
            puts "Pleae enter 'y' for yes or 'n' for no."
            user_input = gets.strip.downcase
        end
        puts "Okay, exiting #{movie.title} now..."
	      puts "Would you like to research another movie?"
        puts "Please enter 'y' for yes or 'n' for no."
        user_input = gets.strip.downcase
	    end
        puts "Thank you for checking out IMDB's Top 100 Scary Movies!"
    end

    #CLI instance methos that initializes and prints all details from top 100 scary movies from IMDB.
    def basic_generate_all
      puts "This is IMDb's Top 100 Scary Movie List....this could take a few minutes"
      scraper = TopOneHundred::Scraper.new
      all_movies = scraper.initialize_all_movies
      all_movies.each{|movie| movie.print_details}
      all_movies
    end
  end