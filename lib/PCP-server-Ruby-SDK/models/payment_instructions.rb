require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentInstructions < ModelBase
      attribute :payee, :payee, :Payee
      # Due date of the payment.
      # Format: YYYYMMDD
      attribute :due_date, :dueDate, :String
      # External payment reference number as part of payment instructions for the consumer
      attribute :reference_number, :referenceNumber, :String
      # Status, usually describing the status of the invoice if paid, overdue, open...
      attribute :status, :status, :String
    end
  end
end
