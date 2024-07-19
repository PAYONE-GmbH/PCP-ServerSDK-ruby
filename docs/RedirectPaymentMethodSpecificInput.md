# PCPServerSDK::RedirectPaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **requires_approval** | **Boolean** | * true &#x3D; the payment requires approval before the funds will be captured using the Approve payment or Capture payment API * false &#x3D; the payment does not require approval, and the funds will be captured automatically  If the parameter is not provided in the request, the default value will be true | [optional] |
| **payment_processing_token** | **String** | ID of the token to use to create the payment. | [optional] |
| **reporting_token** | **String** | Token to identify the card in the reporting. | [optional][readonly] |
| **tokenize** | **Boolean** | Indicates if this transaction should be tokenized   * true - Tokenize the transaction.   * false - Do not tokenize the transaction, unless it would be tokenized by other means such as auto- tokenization of recurring payments. example: false | [optional] |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **payment_product840_specific_input** | [**RedirectPaymentProduct840SpecificInput**](RedirectPaymentProduct840SpecificInput.md) |  | [optional] |
| **redirection_data** | [**RedirectionData**](RedirectionData.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RedirectPaymentMethodSpecificInput.new(
  requires_approval: null,
  payment_processing_token: 0ca037cc-9079-4df7-8f6f-f2a3443ee521,
  reporting_token: 12a037cc-833d-8b45-8f6f-11c34171f4e1,
  tokenize: null,
  payment_product_id: 840,
  payment_product840_specific_input: null,
  redirection_data: null
)
```

