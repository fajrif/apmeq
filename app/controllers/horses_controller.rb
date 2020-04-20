class HorsesController < ApplicationController

  def index
		@horses = Horse.all
		@categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @horses }
      format.js
    end
  end

	def show
		@horse = Horse.friendly.find(params[:id])
	end

end
