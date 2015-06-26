json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :starts_at
  json.url meeting_url(meeting, format: :json)
end
