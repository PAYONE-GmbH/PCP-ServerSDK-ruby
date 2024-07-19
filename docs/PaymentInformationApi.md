# PCPServerSDK::PaymentInformationApi

All URIs are relative to *https://commerce-api.payone.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_payment_information**](PaymentInformationApi.md#create_payment_information) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-information | Create a Payment Information |
| [**get_payment_information**](PaymentInformationApi.md#get_payment_information) | **GET** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId}/payment-information/{paymentInformationId} | Get a Payment Information |


## create_payment_information

> <PaymentInformationResponse> create_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_request)

Create a Payment Information

Creates a new Payment Information for the given Checkout.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentInformationApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_information_request = PCPServerSDK::PaymentInformationRequest.new({amount_of_money: PCPServerSDK::AmountOfMoney.new({amount: 1000, currency_code: 'EUR'}), type: PCPServerSDK::PaymentType::SALE, payment_channel: PCPServerSDK::PaymentChannel::ECOMMERCE, payment_product_id: 37}) # PaymentInformationRequest | 

begin
  # Create a Payment Information
  result = api_instance.create_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentInformationApi->create_payment_information: #{e}"
end
```

#### Using the create_payment_information_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PaymentInformationResponse>, Integer, Hash)> create_payment_information_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_information_request)

```ruby
begin
  # Create a Payment Information
  data, status_code, headers = api_instance.create_payment_information_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_information_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PaymentInformationResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentInformationApi->create_payment_information_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_information_request** | [**PaymentInformationRequest**](PaymentInformationRequest.md) |  |  |

### Return type

[**PaymentInformationResponse**](PaymentInformationResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_payment_information

> <PaymentInformationResponse> get_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_id)

Get a Payment Information

This endpoint can be used to get a paymentInformation of a Checkout.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::PaymentInformationApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
payment_information_id = 'payment_information_id_example' # String | Unique identifier of a paymentInformation

begin
  # Get a Payment Information
  result = api_instance.get_payment_information(merchant_id, commerce_case_id, checkout_id, payment_information_id)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentInformationApi->get_payment_information: #{e}"
end
```

#### Using the get_payment_information_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PaymentInformationResponse>, Integer, Hash)> get_payment_information_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_information_id)

```ruby
begin
  # Get a Payment Information
  data, status_code, headers = api_instance.get_payment_information_with_http_info(merchant_id, commerce_case_id, checkout_id, payment_information_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PaymentInformationResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling PaymentInformationApi->get_payment_information_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **payment_information_id** | **String** | Unique identifier of a paymentInformation |  |

### Return type

[**PaymentInformationResponse**](PaymentInformationResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

