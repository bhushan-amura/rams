class Company::EventsController < ApplicationController

  include Company::EventsHelper

  before_action :set_company
  before_action :set_company_job
  before_action :set_company_event, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, @company
    @company_events = @company_job.events
  end

  # GET /company/1/events/1
  # GET /company/1/events/1.json
  def show
    authorize! :show, @company
  end

  # GET /company/1/events/new
  def new
    authorize! :new, @company
    @company_event = Company::Event.new
  end

  # GET /company/1/events/1/edit
  def edit
    authorize! :edit, @company
  end

  # POST /company/1/events
  # POST /company/1/events.json
  def create
    authorize! :create, @company
    @company_event = @company_job.events.build(company_event_params)

    respond_to do |format|
      if @company_event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to company_job_events_path }
        format.json { render :show, status: :created, location: @company_event }
      else
        format.html { render :new }
        format.json { render json: @company_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/1/events/1
  # PATCH/PUT /company/1/events/1.json
  def update
    authorize! :update, @company
    respond_to do |format|
      if @company_event.update(company_event_params)
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to  company_job_events_path }
        # format.json { render :show, status: :ok, location: @company_event }
      else
        format.html { render :edit }
        format.json { render json: @company_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/1/events/1
  # DELETE /company/1/events/1.json
  def destroy
    authorize! :destroy, @company
    @company_event.destroy
    flash[:notice] = 'Event was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to company_job_events_path  }
      format.json { head :no_content }
    end
  end

  private

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_company_job
      @company_job = Company.find(params[:company_id]).job_opportunities.find(params[:job_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_company_event
      @company_event = @company_job.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_event_params
      params.require(:company_event).permit(:event_type,:organiser,:date_time,:duration, :location_attributes => [:building_number,:building_name,:street_address,:street_name,:city,:state,:country,:zipcode])
    end
end
