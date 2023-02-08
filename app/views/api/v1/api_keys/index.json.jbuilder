json.api_keys @api_keys do |key|
  json.extract! key, :id, :token
end