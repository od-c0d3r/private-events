module EventsHelper
  def attended?(event)
    event.attendees.include?(current_user)
  end

  def event_(event)
    { event_id: event.id, attendee_id: current_user.id }
  end

  def event_public_user(event)
    { event_id: event.id, attendee_id: current_user }
  end

  def user_future_events
    current_user.attended_events.upcoming
  end

  def user_past_events
    current_user.attended_events.past
  end

  def future_events(events)
    events.upcoming
  end

  def past_events(events)
    events.past
  end
end
