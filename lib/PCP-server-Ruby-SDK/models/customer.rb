require_relative 'model_base'

module PCPServerSDK
  module Models
    class Customer < ModelBase
      attribute :company_information, :companyInformation, :CompanyInformation
      # Unique identifier for the customer.
      attribute :merchant_customer_id, :merchantCustomerId, :String
      attribute :billing_address, :billingAddress, :Address
      attribute :contact_details, :contactDetails, :ContactDetails
      # Fiscal registration number of the customer or the tax registration number of the company for a business
      # customer. Please find below specifics per country:
      # * Brazil - Consumer (CPF) with a length of 11 digits
      # * Brazil - Company (CNPJ) with a length of 14 digits
      # * Denmark - Consumer (CPR-nummer or personnummer) with a length of 10 digits
      # * Finland - Consumer (Finnish: henkilötunnus (abbreviated as HETU), Swedish: personbeteckning) with a
      # length of 11 characters
      # * Norway - Consumer (fødselsnummer) with a length of 11 digits
      # * Sweden - Consumer (personnummer) with a length of 10 or 12 digits
      attribute :fiscal_number, :fiscalNumber, :String
      # Business relation to the customer. Possible values:
      # * B2C - Indicates business to consumer
      # * B2B - Indicates business to business
      #
      # Mandatory for the the following payment methods:
      # * 3390 - PAYONE Secured Invoice
      # * 3391 - PAYONE Secured Installment
      # * 3392 - PAYONE Secured Direct Debit
      attribute :business_relation, :businessRelation, :String, enum: ["B2C", "B2B"]
      # The locale that the customer should be addressed in (for 3rd parties).
      #
      # Note: Only the language code is supported.
      attribute :locale, :locale, :String
      attribute :personal_information, :personalInformation, :PersonalInformation
      attribute :account, :account, :CustomerAccount
    end
  end
end
