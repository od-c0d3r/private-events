module EventsHelper
  def me?(user)
    user == current_user
  end

  def my_event?(event)
    me?(event.creator)
  end

  def others_event?(event)
    !my_event? event
  end

  def event_creator(event)
    my_event?(event) ? 'me' : event.creator.name
  end

  def attending?(event)
    event.attendees.include?(current_user)
  end

  def event_token(event)
    { event_id: event.id, attendee_id: current_user.id }
  end

  def event_token_public_user(event)
    { event_id: event.id, attendee_id: current_user}
  end

  def my_future_events
    current_user.attended_events.upcoming
  end

  def my_past_events
    current_user.attended_events.past
  end
  
  def future_events(events)
    events.upcoming
  end

  def past_events(events)
    events.past
  end
end
