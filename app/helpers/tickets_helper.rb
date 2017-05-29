module TicketsHelper
  def assign_status_string(ticket)
    if ticket.assigned?
      # User.find(ticket.assigned_id).email + " (#{ticket.assigned_id})"
      User.find(ticket.assigned_id).email
    else
      t('ticket.infos.not_assigned')
    end
  end

  def acces_string(ticket)
    if ticket.open?
      t('ticket.infos.access_open')
    else
      t('ticket.infos.access_locked')
    end
  end

  def ticket_new_answer(ticket)
    if ticket.answers.any? && (ticket.answers.last.author != current_user.id) && ticket.open?
      return "<b>#{ticket.title}</b>".html_safe
    else
      return ticket.title
    end
  end

  def locked_unlocked(ticket)
    if ticket.open?
      return image_tag("unlocked.png", size: "18x18")
    else
      return image_tag("locked.png", size: "18x18")
    end
  end
end
