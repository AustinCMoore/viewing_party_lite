class MovieFacade
    def movies
      MovieService.top_rated.map do |data|
        Movie.new(data)
      end.take(20)
    end

    def search(movie)
      MovieService.search_for_movie(movie).map do |data|
        Movie.new(data)
      end.take(40)
    end
end