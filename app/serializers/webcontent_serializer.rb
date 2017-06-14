class WebcontentSerializer < ActiveModel::Serializer
  attributes :id, :url, :content, :created_at, :updated_at
end
