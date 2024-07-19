# PCPServerSDK::CheckoutResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commerce_case_id** | **String** | reference to the Commerce Case. | [optional] |
| **checkout_id** | **String** | reference to the Checkout. | [optional] |
| **merchant_customer_id** | **String** | Unique identifier for the customer. | [optional] |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **references** | [**CheckoutReferences**](CheckoutReferences.md) |  | [optional] |
| **shipping** | [**Shipping**](Shipping.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |
| **payment_executions** | [**Array&lt;PaymentExecution&gt;**](PaymentExecution.md) |  | [optional] |
| **checkout_status** | [**StatusCheckout**](StatusCheckout.md) |  | [optional] |
| **status_output** | [**StatusOutput**](StatusOutput.md) |  | [optional] |
| **payment_information** | [**Array&lt;PaymentInformationResponse&gt;**](PaymentInformationResponse.md) |  | [optional] |
| **creation_date_time** | **Time** | Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX  All other formats may be ignored by the system.  | [optional] |
| **allowed_payment_actions** | [**Array&lt;AllowedPaymentActions&gt;**](AllowedPaymentActions.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CheckoutResponse.new(
  commerce_case_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  checkout_id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  merchant_customer_id: 1234,
  amount_of_money: null,
  references: null,
  shipping: null,
  shopping_cart: null,
  payment_executions: null,
  checkout_status: null,
  status_output: null,
  payment_information: null,
  creation_date_time: null,
  allowed_payment_actions: null
)
```

