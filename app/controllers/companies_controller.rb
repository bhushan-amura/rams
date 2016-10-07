class CompaniesController < ApplicationController

  #Helper
  include Company::JobOpportunitiesHelper

  #cancan
  load_and_authorize_resource

  # callbacks
  before_action :set_company, only: [:show, :edit, :update, :destroy, :home]


  # GET /companies
  # GET /companies.json
  def index
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end


  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    respond_to do |format|
      if @company.save
        flash[:notice] = 'Company was successfully created.'
        format.html { redirect_to new_company_job_path(@company) }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        # format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        flash[:notice] = 'Company was successfully updated.'
        format.html { redirect_to home_company_path(@company) }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        # format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      flash[:notice] = 'Company was successfully destroyed.'
      format.html { redirect_to companies_url}
      format.json { head :no_content }
    end
  end


  def home
    if @company.job_opportunities.empty?
      redirect_to new_company_job_path(@company)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:id,:name,:company_type,:url,:tagline,:phone,:number_of_employees,:description,:logo)
    end


end
