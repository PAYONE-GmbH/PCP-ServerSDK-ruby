# PCPServerSDK::PaymentExecutionApi

All URIs are relative to *https://commerce-api.payone.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**cancel_payment_execution**](PaymentExecutionApi.md#cancel_payment_execution) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-executions/{paymentExecutionId}/cancel | Cancel a Payment |
| [**capture_payment_execution**](PaymentExecutionApi.md#capture_payment_execution) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-executions/{paymentExecutionId}/capture | Capture a Payment |
| [**complete_payment**](PaymentExecutionApi.md#complete_payment) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-executions/{paymentExecutionId}/complete | Complete a Payment |
| [**create_payment**](PaymentExecutionApi.md#create_payment) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-executions | Create a Payment |
| [**refund_payment_execution**](PaymentExecutionApi.md#refund_payment_execution) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-executions/{paymentExecutionId}/refund | Refund a Payment |


## cancel_payment_execution

> <CancelPaymentResponse> cancel_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, cancel_payment_request)

Cancel a Payment

This endpoint can be used to reverse the payment associated with this Checkout. The Cancel is only possible for the entire amount of the payment and not partial payments. OrderManagementActions will be impossible after using a PaymentExecution endpoint.  In the light of card payments, reversing an authorization that is not needed will prevent you from having to pay a fee/penalty for unused authorization requests. Whilst scheme regulations require that acquirers and PSPs support authorization reversals, there are no rules towards issuers mandating them to process the reversal advice. Therefore, there is no guarantee the authorization hold is released. The authorization reversal can only be performed by the card issuer, and under no circumstances will we be responsible for performing the authorization reversal.  The cancellationReason is mandatory for BNPL payment methods (paymentProductId 3390, 3391 and 3392). For other payment methods the cancellationReason is not mandatory but can be used for reporting and reconciliation purposes.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentExecutionApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_execution_id = 'payment_execution_id_example' # String | Unique identifier of a paymentExecution
cancel_payment_request = PCPServerSDK::CancelPaymentRequest.new # CancelPaymentRequest | 

begin
  # Cancel a Payment
  result = api_instance.cancel_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, cancel_payment_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->cancel_payment_execution: #{e}"
end
```

#### Using the cancel_payment_execution_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CancelPaymentResponse>, Integer, Hash)> cancel_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, cancel_payment_request)

```ruby
begin
  # Cancel a Payment
  data, status_code, headers = api_instance.cancel_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, cancel_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CancelPaymentResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->cancel_payment_execution_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_execution_id** | **String** | Unique identifier of a paymentExecution |  |
| **cancel_payment_request** | [**CancelPaymentRequest**](CancelPaymentRequest.md) |  |  |

### Return type

[**CancelPaymentResponse**](CancelPaymentResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## capture_payment_execution

> <CapturePaymentResponse> capture_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, capture_payment_request)

Capture a Payment

This endpoint can be used to capture authorized amounts of a payment. The Capture can only be done for Checkouts with status COMPLETED, BILLED or CHARGEBACKED. OrderManagementActions will be impossible after using a PaymentExecution endpoint. It is possible to perform multiple partial captures by providing an amount that is lower than the total authorized amount.  The cancellationReason is mandatory for BNPL payment methods (paymentProductId 3390, 3391 and 3392) if isFinal is set to true and the amount of the Capture is lower than the authorized amount. For other payment methods the cancellationReason is not mandatory in this case but can be used for reporting and reconciliation purposes.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentExecutionApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_execution_id = 'payment_execution_id_example' # String | Unique identifier of a paymentExecution
capture_payment_request = PCPServerSDK::CapturePaymentRequest.new # CapturePaymentRequest | 

begin
  # Capture a Payment
  result = api_instance.capture_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, capture_payment_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->capture_payment_execution: #{e}"
end
```

#### Using the capture_payment_execution_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CapturePaymentResponse>, Integer, Hash)> capture_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, capture_payment_request)

```ruby
begin
  # Capture a Payment
  data, status_code, headers = api_instance.capture_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, capture_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CapturePaymentResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->capture_payment_execution_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_execution_id** | **String** | Unique identifier of a paymentExecution |  |
| **capture_payment_request** | [**CapturePaymentRequest**](CapturePaymentRequest.md) |  |  |

### Return type

[**CapturePaymentResponse**](CapturePaymentResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## complete_payment

> <CompletePaymentResponse> complete_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, complete_payment_request)

Complete a Payment

For PAYONE Secured Installment (paymentProductId 3391) a two-step process is required. The first step is creating a Payment, the second step is completing it by calling this API endpoint. OrderManagementActions will be impossible after using a PaymentExecution endpoint.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentExecutionApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_execution_id = 'payment_execution_id_example' # String | Unique identifier of a paymentExecution
complete_payment_request = PCPServerSDK::CompletePaymentRequest.new # CompletePaymentRequest | 

begin
  # Complete a Payment
  result = api_instance.complete_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_id, complete_payment_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->complete_payment: #{e}"
end
```

#### Using the complete_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CompletePaymentResponse>, Integer, Hash)> complete_payment_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, complete_payment_request)

```ruby
begin
  # Complete a Payment
  data, status_code, headers = api_instance.complete_payment_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, complete_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CompletePaymentResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->complete_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_execution_id** | **String** | Unique identifier of a paymentExecution |  |
| **complete_payment_request** | [**CompletePaymentRequest**](CompletePaymentRequest.md) |  |  |

### Return type

[**CompletePaymentResponse**](CompletePaymentResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_payment

> <CreatePaymentResponse> create_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_request)

Create a Payment

This endpoint can be used to create a payment for a specific payment method. The amount of the payment cannot exceed the overall Checkout amount. OrderManagementActions will be impossible after using a PaymentExecution endpoint.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentExecutionApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_execution_request = PCPServerSDK::PaymentExecutionRequest.new # PaymentExecutionRequest | 

begin
  # Create a Payment
  result = api_instance.create_payment(merchant_id, commerce_case_id, checkout_id, payment_execution_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->create_payment: #{e}"
end
```

#### Using the create_payment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreatePaymentResponse>, Integer, Hash)> create_payment_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_request)

```ruby
begin
  # Create a Payment
  data, status_code, headers = api_instance.create_payment_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreatePaymentResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->create_payment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_execution_request** | [**PaymentExecutionRequest**](PaymentExecutionRequest.md) |  |  |

### Return type

[**CreatePaymentResponse**](CreatePaymentResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## refund_payment_execution

> <RefundPaymentResponse> refund_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, refund_request)

Refund a Payment

This endpoint can be used to refund a payment for the associated Checkout. The Refund can only be done for Checkouts with status BILLED or CHARGEBACKED. OrderManagementActions will be impossible after using a PaymentExecution endpoint.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentExecutionApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_execution_id = 'payment_execution_id_example' # String | Unique identifier of a paymentExecution
refund_request = PCPServerSDK::RefundRequest.new # RefundRequest | 

begin
  # Refund a Payment
  result = api_instance.refund_payment_execution(merchant_id, commerce_case_id, checkout_id, payment_execution_id, refund_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->refund_payment_execution: #{e}"
end
```

#### Using the refund_payment_execution_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RefundPaymentResponse>, Integer, Hash)> refund_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, refund_request)

```ruby
begin
  # Refund a Payment
  data, status_code, headers = api_instance.refund_payment_execution_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_execution_id, refund_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RefundPaymentResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentExecutionApi->refund_payment_execution_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_execution_id** | **String** | Unique identifier of a paymentExecution |  |
| **refund_request** | [**RefundRequest**](RefundRequest.md) |  |  |

### Return type

[**RefundPaymentResponse**](RefundPaymentResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

