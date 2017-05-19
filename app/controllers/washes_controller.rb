class WashesController < ApplicationController
  def index
    @washes = Wash.includes(:vehicle).all
  end

  def show
    @wash = Wash.find(params[:id])
  end

  def new
    redirect_to vehicle, notice: 'Unable to wash. Bed is down' if !vehicle.bed_up
    @wash = vehicle.washes.new(charge: vehicle.calculate_charge)
  end

  def create
    vehicle = Vehicle.find(params[:wash][:vehicle_id])
    @wash = vehicle.washes.new(charge: vehicle.calculate_charge)

    if vehicle.plate == '1111111'
      redirect_to root_path, notice: 'Car stolen and cannot be washed!'
    elsif @wash.save
      redirect_to vehicles_path, notice: 'Car was successfully washed!'
    else
      render :new
    end
  end

  private

  attr_reader :vehicle

  def vehicle
    @vehicle ||= Vehicle.find(params[:vehicle_id])
  end
end
