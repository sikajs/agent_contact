class ContactsController < ApplicationController
  before_action :set_agent
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = @agent.contacts.build
  end

  def create
    @contact = @agent.contacts.build(contact_params)
    if @contact.save
      flash[:success] = "Contact has been created."
      redirect_to [@agent, @contact]
    else
      flash[:warning] = "Contact has not been created."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact has been updated."
      redirect_to [@agent, @contact]
    else
      flash[:warning] = "Contact has not been updated."
      render :edit
    end
  end

  def destroy
    @contact.destroy
    flash[:success] = "Contact has been deleted."
    redirect_to @agent
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :tel, :address)
    end

    def find_contact
      @contact = @agent.contacts.find(params[:id])
    end

    def set_agent
      @agent = Agent.find(params[:agent_id])

      rescue ActiveRecord::RecordNotFound
          flash[:warning] = "The agent you're looking for couldn't be found."
          redirect_to root_path
    end
end
