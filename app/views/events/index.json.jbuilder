json.array!(@events) do |event|
  json.title event.title
  json.body event.body
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event)
end