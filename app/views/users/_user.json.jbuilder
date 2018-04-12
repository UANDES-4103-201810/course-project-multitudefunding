json.extract! user, :id, :name, :last_name, :email, :nickname, :password, :type_access, :created_at, :updated_at
json.url user_url(user, format: :json)
