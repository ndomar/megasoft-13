class PagesController < ApplicationController

  before_filter :removeHtml, except: [:index, :new,:update, :destroy, :create]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    html=params[:page][:html]
    @page = Page.new(params[:page])
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
        target = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
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

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
        target = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
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

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    File.delete("#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html")
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  def reviewer
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    render 'reviewer'
  end

  def designer
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
    render 'designer'
  end

  def returnHtml
    @page = Page.find(params[:id])
    data = File.read("#{@page.html}")
    @page.update_attribute(:html , data)
  end

  def removeHtml
    @page = Page.find(params[:id])
    target = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
    @page.update_attribute(:html , target)
  end

  def download
    @page = Page.find(params[:id])
    send_file "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html", :type=>"html"
  end

  def download_project
    @page = Page.find(params[:id])
    @project = Project.find(@page.project_id)
    compress("#{Rails.public_path}/#{@project.id}")
    send_file "#{Rails.public_path}/#{@project.id}/#{@project.id}.zip",:type => 'application/zip',:disposition => 'attachment',:filename => @project.project_name
  end

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