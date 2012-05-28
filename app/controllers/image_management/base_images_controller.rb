module ImageManagement
  class BaseImagesController < ApplicationController
    # GET /base_images
    # GET /base_images.xml
    def index
      @base_images = ImageManagement::BaseImage.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml # index.xml
      end
    end

    # GET /base_images/1
    # GET /base_images/1.xml
    def show
      @base_image = ImageManagement::BaseImage.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml # show.xml
      end
    end

    # GET /base_images/new
    # GET /base_images/new.xml
    def new
      @base_image = ImageManagement::BaseImage.new

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /base_images/1/edit
    def edit
      @base_image = ImageManagement::BaseImage.find(params[:id])
    end

    # POST /base_images
    # POST /base_images.xml
    def create
      # TODO fix with proper support for generating nested resources
      template = template_from_params

      @base_image = ImageManagement::BaseImage.new(params[:base_image])
      @base_image.template = template
      puts params[:base_image].inspect

      respond_to do |format|
        if @base_image.save
          format.html { redirect_to @base_image, :notice => 'Base image was successfully created.' }
          format.xml { render :action => "show", :status => :created }
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

    private
    # TODO override create, update attributes in model or find correct way to
    # mass assign nested attributed with module namespace
    def template_from_params
      if t = params[:base_image].delete(:template)
        if id = t[:id]
          Template.find(id)
        else
          Template.new(t)
        end
      else
        nil
      end
    end
  end
end