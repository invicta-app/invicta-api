class VolumesController < ApplicationController
  before_action :set_volume, only: %i[ show edit update destroy ]

  def index
    @volumes = Volume.all
  end

  def show
  end

  def create_volume_metadata
    @volume = Volume.create!(create_volume_params)

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

  def destroy
    @volume.destroy

    respond_to do |format|
      format.html { redirect_to volumes_url, notice: "Volume was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def create_volume_params
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
      identifiers: [],
      contributors: [],
      subjects: [],
    )
  end

end
