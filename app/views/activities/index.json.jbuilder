json.array!(@activities) do |activity|
  json.extract! activity, :id, :actor, :type, :object, :object_type
  json.url activity_url(activity, format: :json)
end
