class ContactsController < ApplicationController

	def show
    @contact = Contact.new
	end

  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      redirect_to contact_path, :notice => "Thank you for your message, our team will response to you soon."
    else
      redirect_to contact_path, :alert => "Oops! Something went wrong."
    end
  end

  private

  def params_contact
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
