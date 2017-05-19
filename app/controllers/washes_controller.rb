class WashesController < ApplicationController
  def new
    redirect_to vehicle,
      notice: 'Unable to wash trucks with their bed down' if !vehicle.bed_up

    @wash = vehicle.washes.new(charge: vehicle.base_rate + vehicle.mud_surcharge)
  end

  def create
    vehicle = Vehicle.find(params[:wash][:vehicle_id])
    @wash = vehicle.washes.new(charge: vehicle.base_rate + vehicle.mud_surcharge)
    @wash.save
    redirect_to root_path, notice: "Car washed!"
  end

  private

  attr_reader :vehicle

  def vehicle
    @vehicle ||= Vehicle.find(params[:vehicle_id])
  end
end
