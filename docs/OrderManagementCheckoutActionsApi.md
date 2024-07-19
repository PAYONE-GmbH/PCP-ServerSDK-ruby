# PCPServerSDK::OrderManagementCheckoutActionsApi

All URIs are relative to *https://commerce-api.payone.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_order**](OrderManagementCheckoutActionsApi.md#cancel_order) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/cancel | Mark items of a Checkout as cancelled and automatically cancel the payment for the items |
| [**create_order**](OrderManagementCheckoutActionsApi.md#create_order) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/order | Creates an Order that will automatially execute a Payment |
| [**deliver_order**](OrderManagementCheckoutActionsApi.md#deliver_order) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/deliver | Mark items of a Checkout as delivered and automatically capture the payment for the items |
| [**return_order**](OrderManagementCheckoutActionsApi.md#return_order) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/return | Mark items of a Checkout as returned and automatically refund the payment for the items |


## cancel_order

> <CancelResponse> cancel_order(merchant_id, commerce_case_id, checkout_id, opts)

Mark items of a Checkout as cancelled and automatically cancel the payment for the items

This endpoint can be used to mark items from a Checkout as cancelled and reverse the payment associated with this Checkout. The Cancel endpoint can be used to cancel a full or partial order.  The Cancel request will mark all or (for cancelType PARTIAL) the provided items as CANCELLED, and – in case of an existing authorization – will reverse the payment.  In the light of card payments, reversing an authorization that is not needed will prevent you from having to pay a fee/penalty for unused authorization requests. Whilst scheme regulations require that acquirers and PSPs support authorization reversals, there are no rules towards issuers mandating them to process the reversal advice. Therefore, there is no guarantee the authorization hold is released. The authorization reversal can only be performed by the card issuer, and under no circumstances will we be responsible for performing the authorization reversal.  The cancellationReason is mandatory for BNPL payment methods (paymentProductId 3390, 3391 and 3392). For other payment methods the cancellationReason is not mandatory but can be used for reporting and reconciliation purposes.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::OrderManagementCheckoutActionsApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
opts = {
  cancel_request: PCPServerSDK::CancelRequest.new # CancelRequest | 
}

begin
  # Mark items of a Checkout as cancelled and automatically cancel the payment for the items
  result = api_instance.cancel_order(merchant_id, commerce_case_id, checkout_id, opts)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->cancel_order: #{e}"
end
```

#### Using the cancel_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CancelResponse>, Integer, Hash)> cancel_order_with_http_info(merchant_id, commerce_case_id, checkout_id, opts)

```ruby
begin
  # Mark items of a Checkout as cancelled and automatically cancel the payment for the items
  data, status_code, headers = api_instance.cancel_order_with_http_info(merchant_id, commerce_case_id, checkout_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CancelResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->cancel_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **cancel_request** | [**CancelRequest**](CancelRequest.md) |  | [optional] |

### Return type

[**CancelResponse**](CancelResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_order

> <OrderResponse> create_order(merchant_id, commerce_case_id, checkout_id, order_request)

Creates an Order that will automatially execute a Payment

This endpoint can be used to create an Order that automatically executes a payment for the respective Checkout.  The Order request requires items within the ShoppingCart and can be made for a partial or the entire ShoppingCart of a Checkout. 

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::OrderManagementCheckoutActionsApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
order_request = PCPServerSDK::OrderRequest.new # OrderRequest | 

begin
  # Creates an Order that will automatially execute a Payment
  result = api_instance.create_order(merchant_id, commerce_case_id, checkout_id, order_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->create_order: #{e}"
end
```

#### Using the create_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<OrderResponse>, Integer, Hash)> create_order_with_http_info(merchant_id, commerce_case_id, checkout_id, order_request)

```ruby
begin
  # Creates an Order that will automatially execute a Payment
  data, status_code, headers = api_instance.create_order_with_http_info(merchant_id, commerce_case_id, checkout_id, order_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <OrderResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->create_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **order_request** | [**OrderRequest**](OrderRequest.md) |  |  |

### Return type

[**OrderResponse**](OrderResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deliver_order

> <DeliverResponse> deliver_order(merchant_id, commerce_case_id, checkout_id, deliver_request)

Mark items of a Checkout as delivered and automatically capture the payment for the items

This endpoint can be used to mark items from a Checkout as delivered and to automatically capture the payments for those items. The return can only be done for Checkouts with status COMPLETED, BILLED or CHARGEBACKED and the items have to be in the status ORDERED. If the payment has already been captured (in case of a SALE), the deliver request will only update the item status. 

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::OrderManagementCheckoutActionsApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
deliver_request = PCPServerSDK::DeliverRequest.new # DeliverRequest | 

begin
  # Mark items of a Checkout as delivered and automatically capture the payment for the items
  result = api_instance.deliver_order(merchant_id, commerce_case_id, checkout_id, deliver_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->deliver_order: #{e}"
end
```

#### Using the deliver_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DeliverResponse>, Integer, Hash)> deliver_order_with_http_info(merchant_id, commerce_case_id, checkout_id, deliver_request)

```ruby
begin
  # Mark items of a Checkout as delivered and automatically capture the payment for the items
  data, status_code, headers = api_instance.deliver_order_with_http_info(merchant_id, commerce_case_id, checkout_id, deliver_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DeliverResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->deliver_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **deliver_request** | [**DeliverRequest**](DeliverRequest.md) |  |  |

### Return type

[**DeliverResponse**](DeliverResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## return_order

> <ReturnResponse> return_order(merchant_id, commerce_case_id, checkout_id, opts)

Mark items of a Checkout as returned and automatically refund the payment for the items

This endpoint can be used to mark items from a Checkout as returned and will automatically refund the payments for those items. The return can only be done for Checkouts with status BILLED or CHARGEBACKED and the items have to be in the status DELIVERED. 

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::OrderManagementCheckoutActionsApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
opts = {
  return_request: PCPServerSDK::ReturnRequest.new # ReturnRequest | 
}

begin
  # Mark items of a Checkout as returned and automatically refund the payment for the items
  result = api_instance.return_order(merchant_id, commerce_case_id, checkout_id, opts)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->return_order: #{e}"
end
```

#### Using the return_order_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReturnResponse>, Integer, Hash)> return_order_with_http_info(merchant_id, commerce_case_id, checkout_id, opts)

```ruby
begin
  # Mark items of a Checkout as returned and automatically refund the payment for the items
  data, status_code, headers = api_instance.return_order_with_http_info(merchant_id, commerce_case_id, checkout_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReturnResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling OrderManagementCheckoutActionsApi->return_order_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **return_request** | [**ReturnRequest**](ReturnRequest.md) |  | [optional] |

### Return type

[**ReturnResponse**](ReturnResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

