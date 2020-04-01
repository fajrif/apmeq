class Admins::ContactsController < Admins::BaseController

  def index
    criteria = Contact.where("name LIKE ?", "%#{params[:search]}%")
    @contacts = criteria.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
      format.js
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admins_contacts_url, :notice => "Successfully destroyed contact."
  end

end
