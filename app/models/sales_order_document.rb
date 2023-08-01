class SalesOrderDocument < ApplicationRecord
  CONFIRMED = "confirmed".freeze
  PENDING = "pending".freeze
  CANCELED = "cancelled".freeze
  ARCHIVED = "archived".freeze

  STATUSES = [CONFIRMED, PENDING, CANCELED, ARCHIVED].freeze

  validates :so_num, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
end
