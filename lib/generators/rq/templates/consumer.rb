class Rq<%= class_name %> < RqQueue

  # insert event like: Rq<%= class_name %>.some_event("haha")

  def some_event(h)
    logger.info "async called event with #{h.inspect}"
  end

end