class ProjectMetricsController < ApplicationController
  before_action :set_project_metric, only: %i[ show update destroy ]

  # GET /project_metrics
  def index
    @project_metrics = ProjectMetric.all

    render json: @project_metrics
  end

  # GET /project_metrics/1
  def show
    render json: @project_metric
  end

  # POST /project_metrics
  def create
    @project_metric = ProjectMetric.new(project_metric_params)

    if @project_metric.save
      render json: @project_metric, status: :created, location: @project_metric
    else
      render json: @project_metric.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_metrics/1
  def update
    if @project_metric.update(project_metric_params)
      render json: @project_metric
    else
      render json: @project_metric.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_metrics/1
  def destroy
    @project_metric.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_metric
      @project_metric = ProjectMetric.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_metric_params
      params.require(:project_metric).permit(:project_id)
    end
end
