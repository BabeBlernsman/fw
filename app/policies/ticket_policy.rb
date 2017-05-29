class TicketPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @ticket = model
  end

  def index?
    @current_user
  end

  def show?
    @current_user && ((@ticket.user == @current_user) || @current_user.admin?)
  end

  def new?
    @current_user
  end

  def create?
    @current_user
  end

  def destroy?
    @current_user.admin?
  end

  def answer?
    @current_user && ((@ticket.user == @current_user) || @current_user.admin?) 
  end

  def open_close?
    @current_user && (@current_user.admin? || @ticket.user == @current_user)
  end
end
