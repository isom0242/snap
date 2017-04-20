json.array!(@group.photos) do |photo|
#  json.extract! photo, :id, :filename, :created_at
   json.partial! photo
end

