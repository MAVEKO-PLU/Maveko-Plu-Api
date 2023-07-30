class SalesOrderDocument < ApplicationRecord
  APPROVED = "approved".freeze
  PENDING = "pending".freeze
  CANCELED = "cancelled".freeze
  ARCHIVED = "archived".freeze

  STATUSES = [APPROVED, PENDING, CANCELED, ARCHIVED].freeze

  validates :so_num, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
end
