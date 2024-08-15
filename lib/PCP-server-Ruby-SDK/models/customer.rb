require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the details of a customer.
    class Customer < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CompanyInformation, nil]
      attr_accessor :company_information

      # Unique identifier for the customer.
      # @return [String, nil]
      attr_accessor :merchant_customer_id

      # @return [PCPServerSDK::Models::Address, nil]
      attr_accessor :billing_address

      # @return [PCPServerSDK::Models::ContactDetails, nil]
      attr_accessor :contact_details

      # Fiscal registration number of the customer or the tax registration number of the company for a business customer. Please find below specifics per country:  
      # - Brazil - Consumer (CPF) with a length of 11 digits  
      # - Brazil - Company (CNPJ) with a length of 14 digits  
      # - Denmark - Consumer (CPR-nummer or personnummer) with a length of 10 digits  
      # - Finland - Consumer (Finnish: henkilötunnus (abbreviated as HETU), Swedish: personbeteckning) with a length of 11 characters  
      # - Norway - Consumer (fødselsnummer) with a length of 11 digits  
      # - Sweden - Consumer (personnummer) with a length of 10 or 12 digits
      # @return [String, nil]
      attr_accessor :fiscal_number

      # Business relation to the customer. Possible values:
      # - B2C - Indicates business to consumer
      # - B2B - Indicates business to business
      # Mandatory for the the following payment methods:
      # - 3390 - PAYONE Secured Invoice
      # - 3391 - PAYONE Secured Installment
      # - 3392 - PAYONE Secured Direct Debit
      # @return [String, nil]
      attr_accessor :business_relation

      # The locale that the customer should be addressed in (for 3rd parties).   Note: Only the language code is supported.
      # @return [String, nil]
      attr_accessor :locale

      # @return [PCPServerSDK::Models::PersonalInformation, nil]
      attr_accessor :personal_information

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            company_information == o.company_information &&
            merchant_customer_id == o.merchant_customer_id &&
            billing_address == o.billing_address &&
            contact_details == o.contact_details &&
            fiscal_number == o.fiscal_number &&
            business_relation == o.business_relation &&
            locale == o.locale &&
            personal_information == o.personal_information
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [company_information, merchant_customer_id, billing_address, contact_details, fiscal_number, business_relation, locale, personal_information].hash
      end

      def to_hash
        hash = {}
        hash['companyInformation'] = @company_information.to_hash unless @company_information.nil?
        hash['merchantCustomerId'] = @merchant_customer_id unless @merchant_customer_id.nil?
        hash['billingAddress'] = @billing_address.to_hash unless @billing_address.nil?
        hash['contactDetails'] = @contact_details.to_hash unless @contact_details.nil?
        hash['fiscalNumber'] = @fiscal_number unless @fiscal_number.nil?
        hash['businessRelation'] = @business_relation unless @business_relation.nil?
        hash['locale'] = @locale unless @locale.nil?
        hash['personalInformation'] = @personal_information.to_hash unless @personal_information.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'companyInformation'
          @company_information = CompanyInformation.new_from_hash(hash['companyInformation'])
        end
        @merchant_customer_id = hash['merchantCustomerId'] if hash.key? 'merchantCustomerId'
        if hash.key? 'billingAddress'
          @billing_address = Address.new_from_hash(hash['billingAddress'])
        end
        if hash.key? 'contactDetails'
          @contact_details = ContactDetails.new_from_hash(hash['contactDetails'])
        end
        @fiscal_number = hash['fiscalNumber'] if hash.key? 'fiscalNumber'
        @business_relation = hash['businessRelation'] if hash.key? 'businessRelation'
        @locale = hash['locale'] if hash.key? 'locale'
        if hash.key? 'personalInformation'
          @personal_information = PersonalInformation.new_from_hash(hash['personalInformation'])
        end
      end
    end
  end
end
