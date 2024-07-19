# PCPServerSDK::PaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_payment_method_specific_input** | [**CardPaymentMethodSpecificInput**](CardPaymentMethodSpecificInput.md) |  | [optional] |
| **mobile_payment_method_specific_input** | [**MobilePaymentMethodSpecificInput**](MobilePaymentMethodSpecificInput.md) |  | [optional] |
| **redirect_payment_method_specific_input** | [**RedirectPaymentMethodSpecificInput**](RedirectPaymentMethodSpecificInput.md) |  | [optional] |
| **sepa_direct_debit_payment_method_specific_input** | [**SepaDirectDebitPaymentMethodSpecificInput**](SepaDirectDebitPaymentMethodSpecificInput.md) |  | [optional] |
| **financing_payment_method_specific_input** | [**FinancingPaymentMethodSpecificInput**](FinancingPaymentMethodSpecificInput.md) |  | [optional] |
| **customer_device** | [**CustomerDevice**](CustomerDevice.md) |  | [optional] |
| **payment_channel** | [**PaymentChannel**](PaymentChannel.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentMethodSpecificInput.new(
  card_payment_method_specific_input: null,
  mobile_payment_method_specific_input: null,
  redirect_payment_method_specific_input: null,
  sepa_direct_debit_payment_method_specific_input: null,
  financing_payment_method_specific_input: null,
  customer_device: null,
  payment_channel: null
)
```

