class Movie < ApplicationRecord
      CATEGORIES = ['Comedy', 'Drama', 'Animation', 'Mystery', 'Horror', 'Fantasy', 'Action', 'Documentary', 'Science Fiction']

      validates :title, presence: true
      validates :year, numericality: {
        greater_than_or_equal_to: 1888,
        les_than_or_equal_to: Date.today.year
      }
      validates :poster_url, presence: true
      validates :category, inclusion: {
    in: CATEGORIES,
        message: "must be one of: #{CATEGORIES.join('. ')}"
      }

      def create
        movie = Movie.create!(movie_params)
        render json: movie, status: :created
      rescue ActiveRecord: :RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end

end
