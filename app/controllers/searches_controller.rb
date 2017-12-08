class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create 
   
    @search = Search.new(search_params)
    if @search.save

      redirect_to @search
    end
  end

  def show
    search = Search.find(params[:id])
    @properties = search.search_property
  end

  private
  def search_params
    params.require(:search).permit(:location,:property_type_id,:max_price_id,:min_price_id)
  end
end
