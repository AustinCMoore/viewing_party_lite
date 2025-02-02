require 'rails_helper'

RSpec.describe 'The Movie Facade' do
  context 'Class Methods' do
    it ".movies" do
      VCR.use_cassette('top_rated_movies') do
        top_rated = MovieFacade.new.best_movies
        expect(top_rated).to be_instance_of(Array)
        expect(top_rated.first).to be_instance_of(Movie)
        expect(top_rated.length).to eq(20)
      end
    end

    it ".movie_search" do
      VCR.use_cassette('movie_search') do
        movie_search = MovieFacade.new.search('Jack Reacher')
        expect(movie_search).to be_instance_of(Array)
        expect(movie_search.first).to be_instance_of(Movie)
        expect(movie_search.length).to be <= 40
      end
    end

    it ".details" do
      VCR.use_cassette('movie_details') do
        movie_details = MovieFacade.new.details(24126)
        expect(movie_details).to be_instance_of(MovieDetail)
      end
    end

    it ".cast" do
      VCR.use_cassette('cast') do
        cast = MovieFacade.new.cast(24126)
        expect(cast).to be_instance_of(Array)
        expect(cast.count).to eq(10)
        expect(cast.first).to be_instance_of(MovieCast)
      end
    end

    it ".reviews" do
      VCR.use_cassette('reviews') do
        reviews = MovieFacade.new.reviews(278)
        expect(reviews).to be_instance_of(Array)
        expect(reviews.first).to be_instance_of(MovieReview)
      end
    end
  end
end
