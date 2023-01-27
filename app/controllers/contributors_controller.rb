class ContributorsController < ApplicationController
  before_action :set_contributor, only: %i[ show update destroy ]

  # GET /contributors
  def index
    @contributors = Contributor.all

    render json: @contributors
  end

  # GET /contributors/1
  def show
    render json: @contributor
  end

  # POST /contributors
  def create
    @contributor = Contributor.new(contributor_params)

    if @contributor.save
      render json: @contributor, status: :created, location: @contributor
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contributors/1
  def update
    if @contributor.update(contributor_params)
      render json: @contributor
    else
      render json: @contributor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contributors/1
  def destroy
    @contributor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contributor_params
      params.require(:contributor).permit(:uuid)
    end
end
