module Api
  module V1
    class BooksController < ApplicationController
      protect_from_forgery with: :null_session

      def show
        params.permit!

        @book = Book.find(params[:id])

        render json: {
          status: 'Success',
          data:   @book
        }
      end

      def create
        params.permit!
        BookCreator.call(params[:volume], params[:metadata], params[:table_of_contents])

        render json: {
          status:  'SUCCESS',
          message: 'Book loaded successfully.',
          data:    @book
        }, status:   :ok
      end
    end
  end
end
