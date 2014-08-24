class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def create
    
  	@project = Project.new(project_params)
  	if @project.save
  		# redirect to projcet page?
  		redirect_to @project, notice: "Project created!"
  	else
  		# show error
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: "Project updated."
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, alert: "Project deleted."
  end

  private
  		def project_params
  			params.require(:project).permit(:name, :description)
  		end

      def set_project
        @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to projects_path, alert: "Project you are looking for doesnt exist"
      end
end
