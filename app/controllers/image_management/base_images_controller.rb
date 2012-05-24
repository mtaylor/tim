module ImageManagement
  class BaseImagesController < ApplicationController
    # GET /base_images
    # GET /base_images.xml
    def index
      @base_images = ImageManagement::BaseImage.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @base_images }
      end
    end

    # GET /base_images/1
    # GET /base_images/1.xml
    def show
      @base_image = ImageManagement::BaseImage.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @base_image }
      end
    end

    # GET /base_images/new
    # GET /base_images/new.xml
    def new
      @base_image = ImageManagement::BaseImage.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml { render :xml => @base_image }
      end
    end

    # GET /base_images/1/edit
    def edit
      @base_image = ImageManagement::BaseImage.find(params[:id])
    end

    # POST /base_images
    # POST /base_images.xml
    def create
      #@base_image = ImageManagement::BaseImage.new(params[:base_image])
      puts params[:base_image].inspect

      respond_to do |format|
        if @base_image.save
          format.html { redirect_to @base_image, :notice => 'Base image was successfully created.' }
          format.xml { render :xml => @base_image, :status => :created, :location => @base_image }
        else
          format.html { render :action => "new" }
          format.xml { render :xml => @base_image.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /base_images/1
    # PUT /base_images/1.xml
    def update
      @base_image = ImageManagement::BaseImage.find(params[:id])

      respond_to do |format|
        if @base_image.update_attributes(params[:base_image])
          format.html { redirect_to @base_image, :notice => 'Base image was successfully updated.' }
          format.xml { head :no_content }
        else
          format.html { render :action => "edit" }
          format.xml { render :xml => @base_image.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /base_images/1
    # DELETE /base_images/1.xml
    def destroy
      @base_image = ImageManagement::BaseImage.find(params[:id])
      @base_image.destroy

      respond_to do |format|
        format.html { redirect_to image_management_base_images_url }
        format.xml { head :no_content }
      end
    end
  end
end