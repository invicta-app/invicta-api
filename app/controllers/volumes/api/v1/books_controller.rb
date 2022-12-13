module Volumes
  module Api
    module V1
      class BooksController < ApplicationController
        protect_from_forgery with: :null_session

        def create
          volume   = params[:volume]
          metadata = params[:metadata]

          # Create Book
          @book = Book.create!(metadata)
          volume.each { |section| create_section(section, @book.id) }

          render json: {
            status:  'SUCCESS',
            message: 'Book loaded successfully.',
            data:    @book
          }, status:   :ok
        end

        def create_volume_metadata
          @volume = Volume.create!(create_volume_metadata_params)

          respond_to do |format|
            if @volume.save
              format.html { redirect_to volume_url(@volume), notice: "Volume was successfully created." }
              format.json { render :show, status: :created, location: @volume }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @volume.errors, status: :unprocessable_entity }
            end
          end
        end

        private

        def create_section(section, book_id)
          contents = section.data
          section  = section.delete(:data)

          @section = BookSection.save!(section, book_id: book_id)

          contents.each { |content| content.book_section_id = @section.id }

          @contents = BookContent.create!(contents)
        end
      end
    end
  end
end
