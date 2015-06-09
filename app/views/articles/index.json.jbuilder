json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price, :expiry_date
  json.url article_url(article, format: :json)
end
