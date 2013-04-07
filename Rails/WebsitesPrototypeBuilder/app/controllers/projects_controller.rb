class ProjectsController < ApplicationController

  def index
    @projects = Project.all

    respond_to do |format|
      format.html 
      format.json { render json: @projects }
    end
  end

  #This is all what i am using
  def show   
    @project = Project.find(params[:id])   #I am sending the project to the design page
    @id = @project.id                      #I am sending the project id explicitly to the design page
    @pages = Page.find(:all, :conditions => {:project_id => @id}) #I am sending the project pages to the design page    
    respond_to do |format|
      format.html 
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

end