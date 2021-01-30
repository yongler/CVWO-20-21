json.extract! todo, :id, :task, :completed, :tags, :created_at, :updated_at
json.url todo_url(todo, format: :json)
