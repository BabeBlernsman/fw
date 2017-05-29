class SpoolController < ApplicationController
  include Pundit
  def index
    authorize Spool
    @tickets = Ticket.all
    @admins = User.admin
  end

  def assign_tick_to_admin
    select_ticket = params[:select_ticket]
    select_admin = params[:select_admin]
    Ticket.find(select_ticket).assigned!
    Ticket.find(select_ticket).update_attributes(assigned_id: select_admin)
    redirect_to spool_index_path
  end
end
