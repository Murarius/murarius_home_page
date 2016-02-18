# class ProjectsController < ApplicationController
class ProjectsController < ApplicationController
  before_action :must_be_logged_in, only: [:new, :create, :index, :destroy, :edit, :update]

  def new
    @project = Project.new
    render('new', layout: 'short_layout')
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to root_url
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
    project.remove_thumb! if project.thumb?
    project.destroy
    flash[:success] = 'Project was successfully destroyed.'
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
    render('edit', layout: 'short_layout')
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was successfully edited.'
      redirect_to root_url
    else
      render('edit', layout: 'short_layout')
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :thumb, :github_link, :demo_link, :when_created, :description, :thumb_cache)
  end
end
