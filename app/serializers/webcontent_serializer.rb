class WebcontentSerializer < ActiveModel::Serializer
  attributes :id, :url, :content, :status_code, :status_message, :headers, :total_time, :created_at, :updated_at
end

