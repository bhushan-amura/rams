class Candidate::LinksController < ApplicationController

  layout 'candidate/layout'
  # helpers
  include Candidate::LinksHelper

  # filters/callbacks
  before_action :set_candidate
  before_action :set_candidate_link, only: [:show, :update, :destroy]

  # GET /candidate/:id/links
  # GET /candidate/:id/links.json
  def index
    @candidate_links = @candidate.links
  end


  # GET /candidate/:id/links/edit
  def edit
    @candidate_links = @candidate.links
    @new_candidate_link = Candidate::Link.new
  end


  # POST /candidate/:id/links
  # POST /candidate/:id/links.json
  def create
    @candidate_link = @candidate.links.build(candidate_link_params)

    respond_to do |format|
      if @candidate_link.save
        flash[:success] =  'Link was successfully created.' 
        format.html { redirect_to edit_candidate_links_path(params[:candidate_id])}
        format.json { render :show, status: :created, location: @candidate_link }
      else
        flash[:failure] =  'Link creation unsuccessful.' 
        format.html { redirect_to  edit_candidate_links_path(params[:candidate_id]) }
        format.json { render json: @candidate_link.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /candidate/:id/links/1
  # PATCH/PUT /candidate/:id/links/1.json
  def update
    respond_to do |format|
      if @candidate_link.update(candidate_link_params)
        flash[:success] =  'Link was successfully updated.' 
        format.html { redirect_to edit_candidate_links_path(params[:candidate_id])}
        format.json { render :show, status: :ok, location: @candidate_link }
      else
        flash[:failure] =  'Link updation unsuccessful.' 
        format.html { redirect_to edit_candidate_links_path(params[:candidate_id]) }
        format.json { render json: @candidate_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate/:id/links/1
  # DELETE /candidate/:id/links/1.json
  def destroy
    @candidate_link.destroy
    flash[:notice] = 'Link was successfully destroyed.' 
    respond_to do |format|
      flash[:success] =  'Link was successfully deleted.' 
      format.html { redirect_to edit_candidate_links_path(params[:candidate_id])}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
    end

    def set_candidate_link
      @candidate_link = @candidate.links.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_link_params
      params.require(:candidate_link).permit(:url,:link_type)
    end
end
