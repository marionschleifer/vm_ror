json.array!(@machines) do |machine|
  json.extract! machine, :id, :name, :positions, :current_position
  json.url machine_url(machine, format: :json)
end
