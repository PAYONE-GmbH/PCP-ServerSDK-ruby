# PCPServerSDK::CreateCheckoutResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **checkout_id** | **String** | Reference to the Checkout. Can be used for following requests to get and update the Checkout and execute the payment. | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |
| **payment_response** | [**CreatePaymentResponse**](CreatePaymentResponse.md) |  | [optional] |
| **error_response** | [**ErrorResponse**](ErrorResponse.md) |  | [optional] |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **references** | [**CheckoutReferences**](CheckoutReferences.md) |  | [optional] |
| **shipping** | [**Shipping**](Shipping.md) |  | [optional] |
| **payment_execution** | [**PaymentExecution**](PaymentExecution.md) |  | [optional] |
| **checkout_status** | [**StatusCheckout**](StatusCheckout.md) |  | [optional] |
| **status_output** | [**StatusOutput**](StatusOutput.md) |  | [optional] |
| **creation_date_time** | **Time** | Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX  All other formats may be ignored by the system.  | [optional] |
| **allowed_payment_actions** | [**Array&lt;AllowedPaymentActions&gt;**](AllowedPaymentActions.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CreateCheckoutResponse.new(
  checkout_id: 707ef15b-7a0a-48f2-b7d8-c95103418a9c,
  shopping_cart: null,
  payment_response: null,
  error_response: null,
  amount_of_money: null,
  references: null,
  shipping: null,
  payment_execution: null,
  checkout_status: null,
  status_output: null,
  creation_date_time: null,
  allowed_payment_actions: null
)
```

