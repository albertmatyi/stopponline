class LocationsController < ApplicationController 
  
  #
  # Should return the top 5 locations starting with the given prefix
  #
  def by_prefix
    @locations = Location.where('name like "'+params[:prefix]+'%"')
    respond_to do |format|
      format.html { render 'index' }
      format.js { render json: @locations }
    end
  end
  
end
