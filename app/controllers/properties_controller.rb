class PropertiesController < ApplicationController

  def home    
    @properties = Property.all   
  end

  def index
    
    if params[:search].nil?
      @properties = []
    else
       @properties = Property.search(params[:search])
    end
  end

  def new
    @property = current_user.properties.new
    @address = @property.build_address
    @property_image = @property.property_images.build
  end

  def create
    if current_user.landlord?
      byebug
      @property = current_user.properties.build(property_params)
      if @property.save
        params[:property_images][:image].each do |p|
          @image = @property.property_images.create(:image => p)
        end
        flash[:success] = 'Add Property'
        redirect_to @property
      else
        render 'new'
      end
    end
  end

  def show
    @property = Property.find(params[:id])
    @images = @property.property_images.all
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end

  def approve
    @properties = Property.unapprove
  end

  def approved
    if Property.where(id: params[:property_id]).update_all(approve: true)
      redirect_to properties_path
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private
  def property_params
    params.require(:property).permit(:member,:security_deposit,:property_type_id,:price,address_attributes: [:street,:property_id],property_images_attributes: [:property_id,:image]) 
  end
  
end
