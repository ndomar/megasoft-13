class CommentsController < ApplicationController
  # called to create a new comment in the database
  # finds the selected page
  # * *Args* :
  # - +@page+ -> the current page
  # - +@project+ -> the current project
  # - +@project_name+ -> name of the current project
  # - +@comment+ -> the comment written in the notepaper
  # - +@email+ -> page designer's email
  # - +@designer+ -> the page owner(designer)
  # - +@timestamp+ -> time when comment was submitted
  # * *Returns* :
  # - page refreshed and comment added to db and email sent to designer
  #
  def create
    # finds the selected page
    @page = Page.find(params[:page_id])
    @page_name = @page.page_name
    @project = Project.find(@page.project_id)
    @comment = @page.comments.build(params[:comment])
    @designer = Designer.find(@project.designer_id)
    @email = @designer.email
    @timestamp = Time.now
    respond_to do |format|
    if @comment.save
      # send a notification email to the designer if comment was saved in the database including theses attributes
      SendNotification.send_notification(@email, @comment, @timestamp, @page_name).deliver();
      # if Succedeed notify the user, and redirect to the reviewing page
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page,:notice => 'Comment was successfully created.' }
  	  # alert("Comment was successfully created")
    else
      # alert("comment was not created")
      # if Succedeed notify the user, and redirect to the reviewing page
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Comment could not be saved. Please fill in all fields' }
      end
    end
  end

  # called to delete a comment from the database
  # * *Args* :
  # - +@page+ -> the current page
  # - +@comment+ -> the comment selected to be deleted
  # * *Returns* :
  # - AJAX used to delete answer (slides up and the comment is removed from the db)
  #
  def destroy
    # find the item
    @comment = Comment.find(params[:id])
    @page = Page.find(params[:page_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Comment was successfully deleted.' }
      # Use AJAX for deletion
      format.js   { render :layout => false }
    end
  end
end