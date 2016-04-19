class Log < ActiveRecord::Base
  enum status: [:pending, :approved, :initiated, :printed, :completed, :canceled, :verifying, :refunded]
end
