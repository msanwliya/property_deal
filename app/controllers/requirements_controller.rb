class RequirementsController < ApplicationController

  def index 
    @requirements = Requirement.all
  end

  def new
    @requirement = current_user.requirements.build
  end

  def create
    if current_user.renter?
      @requirement = current_user.requirements.build(requirement_params)
      if @requirement.save
        redirect_to requirements_path
      else
        render 'new'
      end
    end
  end


  def show
    requirement = Requirement.find(params[:id])
    @properties = requirement.require_property
  end

  def edit
    @requirement = Requirement.find(params[:id])
  end

  def update
    @requirement = Requirement.find(params[:id])
    if @requirement.update(requirement_params)
      redirect_to @requirement
    else
      render 'edit'
    end
  end

  def suggestion
    requirement = Requirement.find(params[:id])
    @properties = requirement.require_property
  end

  private

  def requirement_params
    params.require(:requirement).permit(:location,:property_type_id,:max ,:min) 
  end 

end
