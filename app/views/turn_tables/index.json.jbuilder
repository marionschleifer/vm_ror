json.array!(@turn_tables) do |turn_table|
  json.extract! turn_table, :id, :open, :machine_id
  json.url turn_table_url(turn_table, format: :json)
end
