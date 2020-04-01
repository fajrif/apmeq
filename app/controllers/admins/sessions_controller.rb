class Admins::SessionsController < Devise::SessionsController

protected
  def after_sign_in_path_for(resource)
    admins_root_url
  end

  def after_sign_out_path_for(resource)
    root_url
  end
end
