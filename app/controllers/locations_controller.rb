class LocationsController < ApplicationController

  # helpers
  include LocationsHelper

  # filters/callbacks
  before_action :set_entity
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /location
  # GET /location.json
  def show
  end

  # GET /location/new
  def new
    @location = Location.new
  end

  # GET /location/edit
  def edit
  end

  # POST /location
  # POST /location.json
  def create
    @location = @entity.build_location(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to self.send(location_path), notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location
  # PATCH/PUT /location.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to self.send(location_path), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location
  # DELETE /location.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      if params.has_key?(:company_id)
        @entity = Company.find(params[:company_id])
      elsif params.has_key?(:candidate_id)
        @entity = Candidate.find(params[:candidate_id])
      elsif params.has_key?(:event_id)
        @entity = Company::Event.find(params[:event_id])
      end
    end

    def set_location
      @location = @entity.location 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:city,:street_address,:street_name,:building_name,:building_number,:zipcode,:state,:country,:latitude,:longitute)
    end
end
