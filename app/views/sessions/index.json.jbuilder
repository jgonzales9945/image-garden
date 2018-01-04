json.array!(@sessions) do |session|
  json.extract! session, :id, :name, :password_digest, :confirm_password_digest
  json.url session_url(session, format: :json)
end
