class SupplierDocumentSerializer < ActiveModel::Serializer
  attributes :id, :reference_no, :supplier, :status, :created_at, :updated_at, :effective_date
end
