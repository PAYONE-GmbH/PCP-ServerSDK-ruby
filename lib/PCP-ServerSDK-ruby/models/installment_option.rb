require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    class InstallmentOption < PCPServerSDK::ApiModel
      # Installment option Identifier. Use this in the Complete Payment for the selected installment option.
      # @return [String, nil]
      attr_accessor :installment_option_id

      # The number of monthly payments for this installment.
      # @return [Integer, nil]
      attr_accessor :number_of_payments

      # Monthly rate amount.
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :monthly_amount

      # Last rate amount.
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :last_rate_amount

      # Effective interest amount in percent with two decimals.
      # @return [Integer, nil]
      attr_accessor :effective_interest_rate

      # Nominal interest amount in percent with two decimals.
      # @return [Integer, nil]
      attr_accessor :nominal_interest_rate

      # Total rate amount.
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :total_amount

      # Due date of first rate. Format: YYYYMMDD
      # @return [String, nil]
      attr_accessor :first_rate_date

      # Link with credit information.
      # @return [PCPServerSDK::Models::LinkInformation, nil]
      attr_accessor :credit_information

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            installment_option_id == o.installment_option_id &&
            number_of_payments == o.number_of_payments &&
            monthly_amount == o.monthly_amount &&
            last_rate_amount == o.last_rate_amount &&
            effective_interest_rate == o.effective_interest_rate &&
            nominal_interest_rate == o.nominal_interest_rate &&
            total_amount == o.total_amount &&
            first_rate_date == o.first_rate_date &&
            credit_information == o.credit_information
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [installment_option_id, number_of_payments, monthly_amount, last_rate_amount, effective_interest_rate, nominal_interest_rate, total_amount, first_rate_date, credit_information].hash
      end

      def to_hash
        hash = {}
        hash['installmentOptionId'] = @installment_option_id unless @installment_option_id.nil?
        hash['numberOfPayments'] = @number_of_payments unless @number_of_payments.nil?
        hash['monthlyAmount'] = @monthly_amount.to_hash unless @monthly_amount.nil?
        hash['lastRateAmount'] = @last_rate_amount.to_hash unless @last_rate_amount.nil?
        hash['effectiveInterestRate'] = @effective_interest_rate unless @effective_interest_rate.nil?
        hash['nominalInterestRate'] = @nominal_interest_rate unless @nominal_interest_rate.nil?
        hash['totalAmount'] = @total_amount.to_hash unless @total_amount.nil?
        hash['firstRateDate'] = @first_rate_date unless @first_rate_date.nil?
        hash['creditInformation'] = @credit_information.to_hash unless @credit_information.nil?
        hash
      end

      def from_hash(hash)
        @installment_option_id = hash['installmentOptionId'] if hash.key? 'installmentOptionId'
        @number_of_payments = hash['numberOfPayments'] if hash.key? 'numberOfPayments'
        if hash.key? 'monthlyAmount'
          @monthly_amount = AmountOfMoney.new_from_hash(hash['monthlyAmount'])
        end
        if hash.key? 'lastRateAmount'
          @last_rate_amount = AmountOfMoney.new_from_hash(hash['lastRateAmount'])
        end
        @effective_interest_rate = hash['effectiveInterestRate'] if hash.key? 'effectiveInterestRate'
        @nominal_interest_rate = hash['nominalInterestRate'] if hash.key? 'nominalInterestRate'
        if hash.key? 'totalAmount'
          @total_amount = AmountOfMoney.new_from_hash(hash['totalAmount'])
        end
        @first_rate_date = hash['firstRateDate'] if hash.key? 'firstRateDate'
        if hash.key? 'creditInformation'
          @credit_information = LinkInformation.new_from_hash(hash['creditInformation'])
        end
      end
    end
  end
end
