# PCPServerSDK::CreateCheckoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **references** | [**CheckoutReferences**](CheckoutReferences.md) |  | [optional] |
| **shipping** | [**Shipping**](Shipping.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartInput**](ShoppingCartInput.md) |  | [optional] |
| **order_request** | [**OrderRequest**](OrderRequest.md) |  | [optional] |
| **creation_date_time** | **Time** | Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX  All other formats may be ignored by the system.  | [optional] |
| **auto_execute_order** | **Boolean** | Set this flag to directly execute a payment when creating a Commerce Case or Checkout. If the value for autoExecuteOrder is set to true, the paymentMethodSpecificInput for the order is mandatory and has to be provided. The autoExecuteOrder can only be used for orderType &#x3D; full. If no shoppingCart information has been provided, a Payment Execution will be created instead of an Order. As a consequence, only Payment Execution endpoints can be used.  | [optional][default to false] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CreateCheckoutRequest.new(
  amount_of_money: null,
  references: null,
  shipping: null,
  shopping_cart: null,
  order_request: null,
  creation_date_time: null,
  auto_execute_order: null
)
```

