module Volumes
  module Api
    module V1
      class BooksController < ApplicationController
        protect_from_forgery with: :null_session

        def index
          @volumes = Volume.all
        end

        def show; end

        def create
          # params = create_volume_params

          render json: {
            status:  'SUCCESS',
            message: 'Book loaded successfully.',
            data:    { random_data: 123, metadata: params[:metadata] }
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

        def update
          respond_to do |format|
            if @volume.update(volume_params)
              format.html { redirect_to volume_url(@volume), notice: "Volume was successfully updated." }
              format.json { render :show, status: :ok, location: @volume }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @volume.errors, status: :unprocessable_entity }
            end
          end
        end

        private

        def create_volume_params
          params
            .permit(
              volume:   [
                          :id,
                          :body_id,
                          :body_class,
                          :length,
                          :section,
                          data: [:text, :content_type, :length, :metadata, :sequence]
                        ],
              metadata: [
                          :title,
                          :language,
                          :author,
                          :publisher,
                          :description,
                          :date_published,
                          :rights,
                          :length,
                          :length_unit,
                          identifiers:  [],
                          contributors: [],
                          subjects:     [],
                        ]
            )
        end

        def create_volume_metadata_params
          params.permit(
            :title,
            :language,
            :author,
            :publisher,
            :description,
            :date_published,
            :rights,
            :length,
            :length_unit,
            identifiers:  [],
            contributors: [],
            subjects:     []
          )
        end
      end
    end
  end
end
