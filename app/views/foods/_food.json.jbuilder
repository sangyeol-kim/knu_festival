json.extract! food, :id, :title, :content, :image, :created_at, :updated_at
json.url food_url(food, format: :json)
