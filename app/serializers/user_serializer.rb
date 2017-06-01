class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email
end
