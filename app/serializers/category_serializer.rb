class CategorySerializer < ActiveModel::Serializer
  attributes  :id, :name, :parent, :identifier
end