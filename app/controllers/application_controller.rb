class ApplicationController < ActionController::Base
	layout :layout_by_resource

  protected

  def layout_by_resource
		if controller_path.include? "admin"
			if devise_controller?
				"login"
			else
				"admin"
			end
    else
      "application"
    end
  end

end
