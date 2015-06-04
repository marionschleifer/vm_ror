json.array!(@sections) do |section|
  json.extract! section, :id, :empty, :turn_table_id
  json.url section_url(section, format: :json)
end
