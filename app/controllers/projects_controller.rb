class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @history = (@project.comments + @project.status_histories).sort_by(&:created_at).reverse
  end
end