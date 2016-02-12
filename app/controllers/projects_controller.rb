# class ProjectsController < ApplicationController
class ProjectsController < ApplicationController
  def new
    @project = Project.new
    render('new', layout: 'short_layout')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_url, success: 'Project was successfully created.'
    else
      render('new', layout: 'short_layout')
    end
  end

  def index
    @projects = Project.all
    render('index', layout: 'short_layout')
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    flash[:success] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  def edit
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:name, :thumb, :github_link, :demo_link, :when_created, :description)
  end
end
