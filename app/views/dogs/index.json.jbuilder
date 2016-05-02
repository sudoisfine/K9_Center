json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :dob, :checked_in, :info, :breed_id, :owner_id, :vet_id
  json.url dog_url(dog, format: :json)
end
