class PropertiesController < ApplicationController

  def home    
    @properties = Property.all   
  end

  def index
     @properties = Property.search(params[:search])
  end

  def new
    @property = current_user.properties.new
    @address = @property.build_address
  end

  def create
    if current_user.landlord?
      @property = current_user.properties.build(property_params)
      if @property.save 
        flash[:success] = 'Add Property'
        redirect_to @property
      else
        render 'new'
      end
    end
  end

  def show
    @property = Property.find(params[:id])
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

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private
  def property_params

    params.require(:property).permit(:member,:location,:security_deposit,:property_type_id,:price,address_attributes: [:id,:street, :city , :state,:property_id]) 
  end
  
end
