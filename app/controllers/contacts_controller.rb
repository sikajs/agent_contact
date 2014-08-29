class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact has been created."
      redirect_to @contact
    else
      flash[:warning] = "Contact has not been created."
      render :new
    end
  end

  def index
    @contacts = Contact.all
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact has been updated."
      redirect_to @contact
    else
      flash[:warning] = "Contact has not been updated."
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = "Contact has been deleted."
    redirect_to contacts_path
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :tel, :address)
    end

    def find_contact
      @contact = Contact.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "The contact you're looking for couldn't be found."
      redirect_to contacts_path
    end
end
