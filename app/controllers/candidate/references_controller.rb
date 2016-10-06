class Candidate::ReferencesController < ApplicationController

  load_and_authorize_resource :candidate
  load_and_authorize_resource :reference, :through => :candidate, :param_method => :candidate_reference_params
  # layouts 
  layout 'candidate/layout'

  # helpers
  include Candidate::ReferencesHelper

  # filters/callbacks
  before_action :set_candidate
  before_action :set_candidate_reference, only: [:update, :destroy]

  # GET /candidate/:id/references
  # GET /candidate/:id/references.json
  def index
    @candidate_references = @candidate.references
  end

  # GET /candidate/:id/references/1/edit
  def edit
    @candidate_references = @candidate.references
    @new_candidate_reference = Candidate::Reference.new
  end

  # POST /candidate/:id/references
  # POST /candidate/:id/references.json
  def create
    @candidate_reference = @candidate.references.build(candidate_reference_params)

    respond_to do |format|
      if @candidate_reference.save
        flash[:success] = 'Reference was successfully created.' 
        format.html { redirect_to edit_candidate_references_path(params[:candidate_id])}
        format.json { render :show, status: :created, location: @candidate_reference }
      else
        flash[:failure] = 'Reference creation unsuccessful.' 
        format.html { redirect_to edit_candidate_references_path(params[:candidate_id]) }
        format.json { render json: @candidate_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate/:id/references/1
  # PATCH/PUT /candidate/:id/references/1.json
  def update
    respond_to do |format|
      if @candidate_reference.update(candidate_reference_params)
        flash[:success] = 'Reference was successfully updated.' 
        format.html { redirect_to edit_candidate_references_path(params[:candidate_id])}
        format.json { render :show, status: :ok, location: @candidate_reference }
      else
        flash[:failure] = 'Reference updation unsuccessful.' 
        @candidate_references = [@candidate_reference]
        @new_candidate_reference = Candidate::Reference.new
        format.html { redirect_to edit_candidate_references_path(params[:candidate_id]) }
        format.json { render json: @candidate_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/:id/references/1
  # DELETE /candidate/:id/references/1.json
  def destroy
    @candidate_reference.destroy
    respond_to do |format|
      flash[:success] = 'Reference was successfully deleted' 
      format.html { redirect_to edit_candidate_references_path(params[:candidate_id])}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end
    
    def set_candidate_reference
      @candidate_reference = @candidate.references.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_reference_params
      params.require(:candidate_reference).permit(:name, :email, :contact)
    end
end
