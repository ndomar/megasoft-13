class PagesController < ApplicationController

  before_filter :removeHtml, except: [:index, :new,:update, :destroy, :create]

  ## 
  #View all pages
  # * *Args*    :
  #   -+@page+ -> get all pages
  # * *Returns*    :
  # - index view containig all pages
  #
  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  ## 
  #View page
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+data+ -> get relevant file content
  # * *Returns*    :
  # - view of this page after updating it's content from the it's file
  #
  def show
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  ## 
  #new page
  # * *Args*    :
  #   -+@page+ -> new page
  # * *Returns*    :
  # - redirects to new.html.erb
  #
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  ## 
  #Edit page
  # * *Args*    :
  #   -+@page+ -> get selected page
  # * *Returns*    :
  # - redirects to edit.html.erb
  #
  def edit
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
  end

  ## 
  #Create page
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+html+ -> save the current HTMl file of passed parameter
  # * *Returns*    :
  # - creates a Html file with the passed name and save it in the project folder
  #
  def create
    html=params[:page][:html]
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }     
        target  = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
        if !File.directory?("#{Rails.public_path}/#{@page.project_id}")
          Dir.mkdir("#{Rails.public_path}/#{@page.project_id}")
          Dir.mkdir("#{Rails.public_path}/#{@page.project_id}/images")
        end
        @page.update_attribute(:html , target)
        File.open(target, "w+") do |f|
          f.write(html)
        end
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  ## 
  #Update page
  # * *Args*    :
  #   -+@page+ -> get selected page
  # * *Returns*    :
  # - Updates the Html file with the passed content
  #
  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
        target  = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
        File.open(target, "w") do |f|
          f.write(@page.html)
        end
        @page.update_attribute(:html , target)
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  ## 
  #Destroy page
  # * *Args*    :
  #   -+@page+ -> get selected page
  # * *Returns*    :
  # - Deletes the selected page from database and it's file
  #
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    File.delete("#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html")
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  ## 
  #Reviewer page
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+data+ -> get relevant file content
  # * *Returns*    :
  # - renders the reviewing page
  #
  def reviewer
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    render 'reviewer'
  end

  ## 
  #Designer page
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+data+ -> get relevant file content
  # * *Returns*    :
  # - renders the designer reviewing page
  #
  def designer
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    render 'designer'
  end

  ## 
  #Remove HTML
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+target+ -> get relevant file location
  # * *Returns*    :
  # - saves the location of the file in the database
  #
  def removeHtml
    @page = Page.find(params[:id])
    target  = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
    @page.update_attribute(:html , target)
  end

  ## 
  #Download HTML
  # * *Args*    :
  #   -+@page+ -> get selected page
  # * *Returns*    :
  # - downloads the selected html file
  #
  def download
    @page = Page.find(params[:id])
    send_file "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html", :type=>"html" 
  end

  ## 
  #Download HTML
  # * *Args*    :
  #   -+@page+ -> get selected page
  #   -+@project+ -> get the project of this page
  # * *Returns*    :
  # - downloads the full project after comprsseing it
  #
  def download_project
    @page = Page.find(params[:id])
    @project = Project.find(@page.project_id)
    compress("#{Rails.public_path}/#{@project.id}")
    send_file "#{Rails.public_path}/#{@project.id}/#{@project.id}.zip",:type => 'application/zip',:disposition => 'attachment',:filename => @project.project_name
  end

  ## 
  #Compress project
  # * *Args*    :
  #   -+archive+ -> the loctaion of the new zip file
  # * *Returns*    :
  # - it compresses a given path into a zip file
  #
  def compress(path)
    gem 'rubyzip'
    require 'zip/zip'
    require 'zip/zipfilesystem'
    path.sub!(%r[/$],'')
    archive = File.join(path,File.basename(path))+'.zip'
    FileUtils.rm archive, :force=>true

    Zip::ZipFile.open(archive, 'w') do |zipfile|
      Dir["#{path}/**/**"].reject{|f|f==archive}.each do |file|
        zipfile.add(file.sub(path+'/',''),file)
        end
      end
  end

end
