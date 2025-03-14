class FlatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @location = params[:query]

    if @location.present?
      @flats = Flat.near(@location, 10)
    else
      @flats = Flat.all
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @markers = [
      {
        lat: @flat.latitude,
        lng: @flat.longitude
      }
    ]
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.build(flat_params)
    if @flat.save
      redirect_to flats_path, notice: "Flat successfully listed!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to dashboard_path, notice: "Flat updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, notice: "Flat successfully deleted!"
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :price, :address, :image)
  end
end
