json.array!(@group.photos) do |photo|
#  json.extract! photo, :id, :filename, :created_at, :updated_at
  json.array! photo, partial: 'groups/photo', as: :photo
end
