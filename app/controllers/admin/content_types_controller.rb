class Admin::ContentTypesController < ApplicationController
  # GET /admin_content_types
  # GET /admin_content_types.xml
  def index
    @content_types = ContentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_content_types }
    end
  end

  # GET /admin_content_types/1
  # GET /admin_content_types/1.xml
  def show
    @content_type = ContentType.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_type }
    end
  end

  # GET /admin_content_types/new
  # GET /admin_content_types/new.xml
  def new
    @content_type = ContentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_type }
    end
  end

  # GET /admin_content_types/1/edit
  def edit
    @content_type = ContentType.get(params[:id])
  end

  # POST /admin_content_types
  # POST /admin_content_types.xml
  def create
    @content_type = ContentType.new(params[:content_type])

    respond_to do |format|
      if @content_type.save
        flash[:notice] = 'ContentType was successfully created.'
        format.html { redirect_to(@content_type) }
        format.xml  { render :xml => @content_type, :status => :created, :location => @content_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_content_types/1
  # PUT /admin_content_types/1.xml
  def update
    @content_type = ContentType.get(params[:id])

    respond_to do |format|
      if @content_type.update_attributes(params[:content_type])
        flash[:notice] = 'ContentType was successfully updated.'
        format.html { redirect_to(@content_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_content_types/1
  # DELETE /admin_content_types/1.xml
  def destroy
    @content_type = ContentType.get(params[:id])
    @content_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_content_types_url) }
      format.xml  { head :ok }
    end
  end
end
