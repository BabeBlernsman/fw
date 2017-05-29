class TicketsController < ApplicationController
  include Pundit
  before_action :set_ticket, only: [:show, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all.where(user_id: current_user)
    authorize @tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show 
    authorize @ticket
    @ticket_owner = @ticket.user
    @answers = @ticket.answers
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    @ticket.user_id = current_user.id
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: I18n.t('ticket.create.ticket') }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    authorize @ticket
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
    end
  end

  def answer
    @ticket = Ticket.find(params[:ticket_id])
    authorize @ticket
    @answer = Answer.new
    if request.post?
      @answer.ticket_id = params[:ticket_id]
      @answer.author = current_user.id
      @answer.body = params[:body]
      @answer.save
      redirect_to @ticket
    end
  end

  def open_close
    @ticket = Ticket.find(params[:ticket_id])
    authorize @ticket
    if @ticket.open?
      @ticket.closed!
    else
      @ticket.open!
    end
    redirect_to @ticket
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :body)
    end
end
