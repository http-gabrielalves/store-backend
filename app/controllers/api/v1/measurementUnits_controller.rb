module Api
  module V1
    #class Api::V1::MeasurementUnitsController < ApplicationController will have name and abbreviation ex: name: 'kilo', abbreviation: 'kg'
    class Api::V1::MeasurementUnitsController < ApplicationController
      before_action :set_measurement_unit, only: %i[ show update destroy ]
    
      # GET /measurement_units
      def index
        @measurement_units = MeasurementUnit.all
    
        render json: @measurement_units
      end
    
      # GET /measurement_units/1
      def show
        render json: @measurement_unit
      end
    
      # POST /measurement_units
      def create
        @measurement_unit = MeasurementUnit.new(measurement_unit_params)
    
        if @measurement_unit.save
          render json: @measurement_unit, status: :created
        else
          render json: @measurement_unit.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /measurement_units/1
      def update
        if @measurement_unit.update(measurement_unit_params)
          render json: @measurement_unit
        else
          render json: @measurement_unit.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /measurement_units/1
      def destroy
        @measurement_unit.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_measurement_unit
          @measurement_unit = MeasurementUnit.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def measurement_unit_params
          params.require(:measurement_unit).permit(:name, :abbreviation)
        end
    end
  end
end


