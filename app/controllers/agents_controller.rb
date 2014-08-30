class AgentsController < ApplicationController
  before_action :find_agent, only: [:show, :edit, :update, :destroy, :set_default]

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      flash[:success] = "agent has been created."
      redirect_to @agent
    else
      flash[:warning] = "agent has not been created."
      render :new
    end
  end

  def index
    @agents = Agent.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @agent.update_attributes!(agent_params)
        #flash[:success] = "agent has been updated."
        format.html { redirect_to @agent, success: "agent has been updated." }
        format.js { render nothing: true }
      else
        #flash[:warning] = "agent has not been updated."
        format.html { render :edit, warning: "agent has not been updated." }
        format.js { render nothing: true }
      end
    end
  end

  def destroy
    @agent.destroy
    flash[:success] = "agent has been deleted."
    redirect_to agents_path
  end

  private
    def agent_params
      params.require(:agent).permit(:name, :default_contact)
    end

    def find_agent
      @agent = Agent.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:warning] = "The agent you're looking for couldn't be found."
      redirect_to root_path
    end
end
