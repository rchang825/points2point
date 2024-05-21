json.extract! card, :id, :name, :points, :value, :conversion, :created_at, :updated_at
json.url card_url(card, format: :json)
