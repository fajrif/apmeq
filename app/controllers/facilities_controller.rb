class FacilitiesController < ApplicationController

  def index
		@facilities = Facility.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facilities }
      format.js
    end
  end

	def show
		@facility = Facility.find(params[:id])
	end

end
