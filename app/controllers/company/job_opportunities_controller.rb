class Company::JobOpportunitiesController < ApplicationController
  before_action :set_company
  before_action :set_company_job_opportunity, only: [:show, :edit, :update, :destroy]

  # GET /company/job_opportunities
  # GET /company/job_opportunities.json
  def index
    @company_job_opportunities = @company.job_opportunities
  end

  # GET /company/job_opportunities/1
  # GET /company/job_opportunities/1.json
  def show
    @company_job_opportunity = Company::JobOpportunity.find(params[:id])
  end

  # GET /company/job_opportunities/new
  def new
    @company_job_opportunity = Company::JobOpportunity.new
  end

  # GET /company/job_opportunities/1/edit
  def edit
  end

  # POST /company/job_opportunities
  # POST /company/job_opportunities.json
  def create
    @company_job_opportunity = Company::JobOpportunity.new(company_job_opportunity_params)

    respond_to do |format|
      if @company_job_opportunity.save
        format.html { redirect_to @company_job_opportunity, notice: 'Job opportunity was successfully created.' }
        format.json { render :show, status: :created, location: @company_job_opportunity }
      else
        format.html { render :new }
        format.json { render json: @company_job_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/job_opportunities/1
  # PATCH/PUT /company/job_opportunities/1.json
  def update
    respond_to do |format|
      if @company_job_opportunity.update(company_job_opportunity_params)
        format.html { redirect_to @company_job_opportunity, notice: 'Job opportunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_job_opportunity }
      else
        format.html { render :edit }
        format.json { render json: @company_job_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/job_opportunities/1
  # DELETE /company/job_opportunities/1.json
  def destroy
    @company_job_opportunity.destroy
    respond_to do |format|
      format.html { redirect_to company_job_opportunities_url, notice: 'Job opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_job_opportunity
      @company_job_opportunity = @company.job_opportunities.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def company_job_opportunity_params
      params.fetch(:company_job_opportunity, {})
    end
end
