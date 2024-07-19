# PCPServerSDK::PaymentOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **merchant_parameters** | **String** | It allows you to store additional parameters for the transaction in JSON format. This field should not contain any personal data. | [optional] |
| **references** | [**PaymentReferences**](PaymentReferences.md) |  | [optional] |
| **card_payment_method_specific_output** | [**CardPaymentMethodSpecificOutput**](CardPaymentMethodSpecificOutput.md) |  | [optional] |
| **mobile_payment_method_specific_output** | [**MobilePaymentMethodSpecificOutput**](MobilePaymentMethodSpecificOutput.md) |  | [optional] |
| **payment_method** | **String** | Payment method identifier based on the paymentProductId. | [optional] |
| **redirect_payment_method_specific_output** | [**RedirectPaymentMethodSpecificOutput**](RedirectPaymentMethodSpecificOutput.md) |  | [optional] |
| **sepa_direct_debit_payment_method_specific_output** | [**SepaDirectDebitPaymentMethodSpecificOutput**](SepaDirectDebitPaymentMethodSpecificOutput.md) |  | [optional] |
| **financing_payment_method_specific_output** | [**FinancingPaymentMethodSpecificOutput**](FinancingPaymentMethodSpecificOutput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentOutput.new(
  amount_of_money: null,
  merchant_parameters: {&#39;SessionID&#39;:&#39;126548354&#39;,&#39;ShopperID&#39;:&#39;7354131&#39;},
  references: null,
  card_payment_method_specific_output: null,
  mobile_payment_method_specific_output: null,
  payment_method: null,
  redirect_payment_method_specific_output: null,
  sepa_direct_debit_payment_method_specific_output: null,
  financing_payment_method_specific_output: null
)
```

