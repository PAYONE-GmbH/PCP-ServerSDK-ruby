# PCPServerSDK::PaymentExecution

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_execution_id** | **String** | Unique ID of paymentExecution. | [optional] |
| **payment_id** | **String** | Unique payment transaction identifier of the payment gateway. | [optional] |
| **card_payment_method_specific_input** | [**CardPaymentMethodSpecificInput**](CardPaymentMethodSpecificInput.md) |  | [optional] |
| **mobile_payment_method_specific_input** | [**MobilePaymentMethodSpecificInput**](MobilePaymentMethodSpecificInput.md) |  | [optional] |
| **redirect_payment_method_specific_input** | [**RedirectPaymentMethodSpecificInput**](RedirectPaymentMethodSpecificInput.md) |  | [optional] |
| **sepa_direct_debit_payment_method_specific_input** | [**SepaDirectDebitPaymentMethodSpecificInput**](SepaDirectDebitPaymentMethodSpecificInput.md) |  | [optional] |
| **financing_payment_method_specific_input** | [**FinancingPaymentMethodSpecificInput**](FinancingPaymentMethodSpecificInput.md) |  | [optional] |
| **payment_channel** | [**PaymentChannel**](PaymentChannel.md) |  | [optional] |
| **references** | [**References**](References.md) |  | [optional] |
| **events** | [**Array&lt;PaymentEvent&gt;**](PaymentEvent.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentExecution.new(
  payment_execution_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  payment_id: 3066019730_1,
  card_payment_method_specific_input: null,
  mobile_payment_method_specific_input: null,
  redirect_payment_method_specific_input: null,
  sepa_direct_debit_payment_method_specific_input: null,
  financing_payment_method_specific_input: null,
  payment_channel: null,
  references: null,
  events: null
)
```

