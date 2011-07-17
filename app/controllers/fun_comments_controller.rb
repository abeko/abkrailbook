class FunCommentsController < ApplicationController
  before_filter :collection_select_author_no, :only => 'create'
  
  # GET /fun_comments
  # GET /fun_comments.xml
  def index
    @fun_comments = FunComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fun_comments }
    end
  end

  # GET /fun_comments/1
  # GET /fun_comments/1.xml
  def show
    @fun_comment = FunComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fun_comment }
    end
  end

  # GET /fun_comments/new
  # GET /fun_comments/new.xml
  def new
    @fun_comment = FunComment.new
    collection_select_author_no

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fun_comment }
    end
  end

  # GET /fun_comments/1/edit
  def edit
    @fun_comment = FunComment.find(params[:id])
    collection_select_author_no
  end

  # POST /fun_comments
  # POST /fun_comments.xml
  def create
    @fun_comment = FunComment.new(params[:fun_comment])

    respond_to do |format|
      if @fun_comment.save
        format.html { redirect_to(@fun_comment, :notice => 'Fun comment was successfully created.') }
        format.xml  { render :xml => @fun_comment, :status => :created, :location => @fun_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fun_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fun_comments/1
  # PUT /fun_comments/1.xml
  def update
    @fun_comment = FunComment.find(params[:id])

    respond_to do |format|
      if @fun_comment.update_attributes(params[:fun_comment])
        format.html { redirect_to(@fun_comment, :notice => 'Fun comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fun_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fun_comments/1
  # DELETE /fun_comments/1.xml
  def destroy
    @fun_comment = FunComment.find(params[:id])
    @fun_comment.destroy

    respond_to do |format|
      format.html { redirect_to(fun_comments_url) }
      format.xml  { head :ok }
    end
  end
  
  def specific_author_new
    @fun_comment = FunComment.new
    @fun_comment.author_no =  params[:id]
    collection_select_author_no
    render 'new'
  end
  
  private
  def collection_select_author_no
    @authors = Author.all
  end
  
end
