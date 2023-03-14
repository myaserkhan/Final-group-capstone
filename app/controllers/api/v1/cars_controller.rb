class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  # GET /cars
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: { message: 'Car created successfully' }, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :description, :price, :duration, :imgurl, :brand)
  end
end
