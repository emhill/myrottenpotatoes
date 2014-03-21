class Movie < ActiveRecord::Base
	attr_accessible :title, :rating, :description, :release_date
     
      class Movie::InvalidKeyError < StandardError ; end
     
      def self.api_key
        'cc4b67c52acb514bdf4931f7cedfd12b' # replace with YOUR Tmdb key
      end
     
      def self.find_in_tmdb(string)
        Tmdb.api_key = self.api_key
        begin
          TmdbMovie.find(:title => string)
        rescue ArgumentError => tmdb_error
          raise Movie::InvalidKeyError, tmdb_error.message
        end
      end

end
