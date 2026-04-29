require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK.rb'

RSpec.describe 'required field validation' do
  describe PCPServerSDK::Models::AmountOfMoney do
    it 'rejects missing required fields during initialization' do
      expect do
        described_class.new(currency_code: 'EUR')
      end.to raise_error(ArgumentError, 'amount cannot be nil')
    end

    it 'allows empty initialization until the object is serialized' do
      amount = described_class.new({})

      expect do
        amount.to_hash
      end.to raise_error(ArgumentError, 'amount cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'currencyCode' => 'EUR' })
      end.to raise_error(ArgumentError, 'amount cannot be nil')
    end
  end

  describe PCPServerSDK::Models::CartItemSupplierReferences do
    it 'allows empty initialization until the object is serialized' do
      supplier_references = described_class.new({})

      expect do
        supplier_references.to_hash
      end.to raise_error(ArgumentError, 'supplier_id cannot be nil')
    end

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(order_reference: 'order-123')
      end.to raise_error(ArgumentError, 'supplier_id cannot be nil')
    end

    it 'rejects nil assignment after initialization' do
      supplier_references = described_class.new(supplier_id: 'supplier-123')

      expect do
        supplier_references.supplier_id = nil
      end.to raise_error(ArgumentError, 'supplier_id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::RefreshPaymentRequest do
    it 'rejects omitted required fields during serialization even when initialize does not assign nil explicitly' do
      request = described_class.new({})

      expect do
        request.to_hash
      end.to raise_error(ArgumentError, 'refresh_type cannot be nil')
    end
  end

  describe PCPServerSDK::Models::PaymentInformationRequest do
    let(:amount_of_money) { PCPServerSDK::Models::AmountOfMoney.new(amount: 100, currency_code: 'EUR') }

    it 'accepts omitted optional fields when required fields are present' do
      request = described_class.new(
        amount_of_money: amount_of_money,
        type: PCPServerSDK::Models::PaymentType::SALE,
        payment_channel: PCPServerSDK::Models::PaymentChannel::ECOMMERCE,
        payment_product_id: 840
      )

      expect(request.merchant_reference).to be_nil
      expect(request.payment_product_id).to eq(840)
    end
  end

  describe PCPServerSDK::Models::APIError do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(message: 'boom')
      end.to raise_error(ArgumentError, 'error_code cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      error = described_class.new({})

      expect do
        error.to_hash
      end.to raise_error(ArgumentError, 'error_code cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'message' => 'boom' })
      end.to raise_error(ArgumentError, 'error_code cannot be nil')
    end

    it 'rejects nil assignment after initialization' do
      error = described_class.new(error_code: 'E0001')

      expect do
        error.error_code = nil
      end.to raise_error(ArgumentError, 'error_code cannot be nil')
    end
  end

  describe PCPServerSDK::Models::ApplePaymentDataTokenHeaderInformation do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(application_data: 'abcd1234')
      end.to raise_error(ArgumentError, 'transaction_id cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'applicationData' => 'abcd1234' })
      end.to raise_error(ArgumentError, 'transaction_id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::ApplePaymentDataTokenInformation do
    let(:header) do
      PCPServerSDK::Models::ApplePaymentDataTokenHeaderInformation.new(transaction_id: 'tx-123')
    end

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(signature: 'signed-payload', header: header)
      end.to raise_error(ArgumentError, 'version cannot be nil')
    end

    it 'rejects missing nested required fields during deserialization' do
      expect do
        described_class.build_from_hash({
          'version' => 'EC_V1',
          'signature' => 'signed-payload',
          'header' => {}
        })
      end.to raise_error(ArgumentError, 'transaction_id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::References do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(descriptor: 'descriptor')
      end.to raise_error(ArgumentError, 'merchant_reference cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'descriptor' => 'descriptor' })
      end.to raise_error(ArgumentError, 'merchant_reference cannot be nil')
    end
  end

  describe PCPServerSDK::Models::Order do
    let(:references) { PCPServerSDK::Models::References.new(merchant_reference: 'ref-123') }

    it 'rejects missing required nested objects during serialization after empty initialization' do
      order = described_class.new({})

      expect do
        order.to_hash
      end.to raise_error(ArgumentError, 'references cannot be nil')
    end

    it 'rejects partially initialized models missing required nested objects' do
      expect do
        described_class.new(amount_of_money: PCPServerSDK::Models::AmountOfMoney.new(amount: 100, currency_code: 'EUR'))
      end.to raise_error(ArgumentError, 'references cannot be nil')
    end

    it 'rejects nil assignment for required nested objects after initialization' do
      order = described_class.new(references: references)

      expect do
        order.references = nil
      end.to raise_error(ArgumentError, 'references cannot be nil')
    end
  end

  describe PCPServerSDK::Models::OrderItem do
    it 'rejects partially initialized item models missing required fields' do
      expect do
        described_class.new(quantity: 2)
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it 'rejects missing required item fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'quantity' => 2 })
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::InstallmentOption do
    it 'rejects partially initialized models with many missing required fields' do
      expect do
        described_class.new(installment_option_id: 'opt-1')
      end.to raise_error(ArgumentError, 'credit_information cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      installment_option = described_class.new({})

      expect do
        installment_option.to_hash
      end.to raise_error(ArgumentError, 'credit_information cannot be nil')
    end
  end

  describe PCPServerSDK::Models::PaymentProduct3391SpecificInput do
    let(:bank_account_information) do
      PCPServerSDK::Models::BankAccountInformation.new(iban: 'DE89370400440532013000', account_holder: 'Jane Doe')
    end

    it 'rejects partially initialized models missing required nested objects' do
      expect do
        described_class.new(installment_option_id: 'installment-1')
      end.to raise_error(ArgumentError, 'bank_account_information cannot be nil')
    end

    it 'rejects nested deserialization when required nested fields are missing' do
      expect do
        described_class.build_from_hash({
          'installmentOptionId' => 'installment-1',
          'bankAccountInformation' => { 'iban' => 'DE89370400440532013000' }
        })
      end.to raise_error(ArgumentError, 'account_holder cannot be nil')
    end

    it 'rejects nil assignment for required nested objects after initialization' do
      input = described_class.new(
        installment_option_id: 'installment-1',
        bank_account_information: bank_account_information
      )

      expect do
        input.bank_account_information = nil
      end.to raise_error(ArgumentError, 'bank_account_information cannot be nil')
    end
  end

  describe PCPServerSDK::Models::PositiveAmountOfMoney do
    it 'rejects missing required fields during initialization' do
      expect do
        described_class.new(currency_code: 'EUR')
      end.to raise_error(ArgumentError, 'amount cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'currencyCode' => 'EUR' })
      end.to raise_error(ArgumentError, 'amount cannot be nil')
    end
  end

  describe PCPServerSDK::Models::RedirectionData do
    it 'rejects missing required fields during serialization after empty initialization' do
      redirection_data = described_class.new({})

      expect do
        redirection_data.to_hash
      end.to raise_error(ArgumentError, 'return_url cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({})
      end.to raise_error(ArgumentError, 'return_url cannot be nil')
    end
  end

  describe PCPServerSDK::Models::FundDistribution do
    it 'rejects partially initialized models missing the first required field' do
      expect do
        described_class.new(amount: 100, type: 'COMMISSION')
      end.to raise_error(ArgumentError, 'account_id cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      fund_distribution = described_class.new({})

      expect do
        fund_distribution.to_hash
      end.to raise_error(ArgumentError, 'account_id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::Payee do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(name: 'Jane Doe')
      end.to raise_error(ArgumentError, 'iban cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      payee = described_class.new({})

      expect do
        payee.to_hash
      end.to raise_error(ArgumentError, 'name cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'name' => 'Jane Doe' })
      end.to raise_error(ArgumentError, 'iban cannot be nil')
    end
  end

  describe PCPServerSDK::Models::PaymentInstructions do
    let(:payee) { PCPServerSDK::Models::Payee.new(iban: 'DE89370400440532013000', name: 'Jane Doe') }

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(payee: payee)
      end.to raise_error(ArgumentError, 'due_date cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      instructions = described_class.new({})

      expect do
        instructions.to_hash
      end.to raise_error(ArgumentError, 'payee cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({
          'payee' => { 'iban' => 'DE89370400440532013000', 'name' => 'Jane Doe' },
          'referenceNumber' => 'REF-123'
        })
      end.to raise_error(ArgumentError, 'due_date cannot be nil')
    end
  end

  describe PCPServerSDK::Models::ProcessingMandateInformation do
    let(:bank_account_information) do
      PCPServerSDK::Models::BankAccountInformation.new(iban: 'DE89370400440532013000', account_holder: 'Jane Doe')
    end

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(bank_account_iban: bank_account_information)
      end.to raise_error(ArgumentError, 'creditor_id cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      mandate_information = described_class.new({})

      expect do
        mandate_information.to_hash
      end.to raise_error(ArgumentError, 'bank_account_iban cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({
          'bankAccountIban' => { 'iban' => 'DE89370400440532013000', 'accountHolder' => 'Jane Doe' },
          'dateOfSignature' => '20260424',
          'creditorId' => 'DE98ZZZ09999999999',
          'uniqueMandateReference' => 'MANDATE-123'
        })
      end.to raise_error(ArgumentError, 'recurrence_type cannot be nil')
    end
  end

  describe PCPServerSDK::Models::PaymentInformationRefundRequest do
    let(:amount_of_money) { PCPServerSDK::Models::PositiveAmountOfMoney.new(amount: 100, currency_code: 'EUR') }

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(account_holder: 'Jane Doe')
      end.to raise_error(ArgumentError, 'amount_of_money cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      refund_request = described_class.new({})

      expect do
        refund_request.to_hash
      end.to raise_error(ArgumentError, 'amount_of_money cannot be nil')
    end

    it 'allows optional fields when the required amount is present' do
      refund_request = described_class.new(amount_of_money: amount_of_money)

      expect(refund_request.references).to be_nil
      expect(refund_request.account_holder).to be_nil
    end
  end

  describe PCPServerSDK::Models::PaymentExecutionSpecificInput do
    let(:payment_references) { PCPServerSDK::Models::References.new(merchant_reference: 'payment-ref-123') }

    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(amount_of_money: PCPServerSDK::Models::AmountOfMoney.new(amount: 100, currency_code: 'EUR'))
      end.to raise_error(ArgumentError, 'payment_references cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      specific_input = described_class.new({})

      expect do
        specific_input.to_hash
      end.to raise_error(ArgumentError, 'payment_references cannot be nil')
    end

    it 'rejects missing required fields during deserialization' do
      expect do
        described_class.build_from_hash({
          'amountOfMoney' => { 'amount' => 100, 'currencyCode' => 'EUR' }
        })
      end.to raise_error(ArgumentError, 'payment_references cannot be nil')
    end

    it 'rejects nil assignment after initialization' do
      specific_input = described_class.new(payment_references: payment_references)

      expect do
        specific_input.payment_references = nil
      end.to raise_error(ArgumentError, 'payment_references cannot be nil')
    end
  end

  describe PCPServerSDK::Models::CreateCheckoutRequest do
    it 'keeps optional defaults intact' do
      request = described_class.new({})

      expect(request.auto_execute_order).to be(false)
    end
  end

  describe PCPServerSDK::Models::CompletePaymentProduct840SpecificInput do
    it 'preserves existing enum validation for non-nil values' do
      expect do
        described_class.new(action: 'INVALID_ACTION')
      end.to raise_error(ArgumentError, 'invalid value for "action", must be one of ["CONFIRM_ORDER_STATUS"].')
    end
  end

  describe PCPServerSDK::Models::CancelItem do
    it 'rejects partially initialized item models missing required fields' do
      expect do
        described_class.new(quantity: 1)
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it 'rejects missing required item fields during serialization after empty initialization' do
      item = described_class.new({})

      expect do
        item.to_hash
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::DeliverItem do
    it 'rejects partially initialized item models missing required fields' do
      expect do
        described_class.new(quantity: 1)
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it 'rejects missing required item fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'quantity' => 1 })
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::LinkInformation do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(type: 'application/json')
      end.to raise_error(ArgumentError, 'href cannot be nil')
    end

    it 'rejects missing required fields during serialization after empty initialization' do
      link_information = described_class.new({})

      expect do
        link_information.to_hash
      end.to raise_error(ArgumentError, 'href cannot be nil')
    end
  end

  describe PCPServerSDK::Models::OrderLineDetailsInput do
    it 'rejects partially initialized models missing required fields' do
      expect do
        described_class.new(quantity: 1)
      end.to raise_error(ArgumentError, 'product_price cannot be nil')
    end

    it 'keeps optional defaults intact when required fields are present' do
      line_details = described_class.new(product_price: 480, quantity: 1)

      expect(line_details.tax_amount_per_unit).to be(false)
      expect(line_details.product_code).to be_nil
    end
  end

  describe PCPServerSDK::Models::PaymentProduct3392SpecificInput do
    let(:bank_account_information) do
      PCPServerSDK::Models::BankAccountInformation.new(iban: 'DE89370400440532013000', account_holder: 'Jane Doe')
    end

    it 'rejects missing required nested objects during serialization after empty initialization' do
      input = described_class.new({})

      expect do
        input.to_hash
      end.to raise_error(ArgumentError, 'bank_account_information cannot be nil')
    end

    it 'rejects nil assignment for required nested objects after initialization' do
      input = described_class.new(bank_account_information: bank_account_information)

      expect do
        input.bank_account_information = nil
      end.to raise_error(ArgumentError, 'bank_account_information cannot be nil')
    end
  end

  describe PCPServerSDK::Models::ReturnItem do
    it 'rejects partially initialized item models missing required fields' do
      expect do
        described_class.new(quantity: 1)
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end

    it 'rejects missing required item fields during deserialization' do
      expect do
        described_class.build_from_hash({ 'quantity' => 1 })
      end.to raise_error(ArgumentError, 'id cannot be nil')
    end
  end

  describe PCPServerSDK::Models::CommerceCasesResponse do
    it 'keeps array wrapper behavior unchanged' do
      response = described_class.build_from_hash([])

      expect(response).to be_a(described_class)
      expect(response).to be_empty
    end
  end
end
