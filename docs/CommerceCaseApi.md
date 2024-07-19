# PCPServerSDK::CommerceCaseApi

All URIs are relative to *https://commerce-api.payone.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_commerce_case**](CommerceCaseApi.md#create_commerce_case) | **POST** /v1/{merchantId}/commerce-cases | Create a Commerce Case |
| [**get_commerce_case**](CommerceCaseApi.md#get_commerce_case) | **GET** /v1/{merchantId}/commerce-cases/{commerceCaseId} | Get Commerce Case Details |
| [**get_commerce_cases**](CommerceCaseApi.md#get_commerce_cases) | **GET** /v1/{merchantId}/commerce-cases | Get a list of Commerce Cases based on Search Parameters |
| [**update_commerce_case**](CommerceCaseApi.md#update_commerce_case) | **PATCH** /v1/{merchantId}/commerce-cases/{commerceCaseId} | Modify an existing Commerce Case. |


## create_commerce_case

> <CreateCommerceCaseResponse> create_commerce_case(merchant_id, create_commerce_case_request)

Create a Commerce Case

This endpoint can be used to create a Commerce Case in combination with a Checkout and an Order. A Commerce Case is a container for multiple Checkouts and can be directly linked to one customer. The Order can either be directly executed or the paymentMethodSpecificInput can also be stored for a later execution over the OrderManagementCheckoutActions or Payment Execution endpoint.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CommerceCaseApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
create_commerce_case_request = PCPServerSDK::CreateCommerceCaseRequest.new # CreateCommerceCaseRequest | 

begin
  # Create a Commerce Case
  result = api_instance.create_commerce_case(merchant_id, create_commerce_case_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->create_commerce_case: #{e}"
end
```

#### Using the create_commerce_case_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateCommerceCaseResponse>, Integer, Hash)> create_commerce_case_with_http_info(merchant_id, create_commerce_case_request)

```ruby
begin
  # Create a Commerce Case
  data, status_code, headers = api_instance.create_commerce_case_with_http_info(merchant_id, create_commerce_case_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateCommerceCaseResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->create_commerce_case_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **create_commerce_case_request** | [**CreateCommerceCaseRequest**](CreateCommerceCaseRequest.md) |  |  |

### Return type

[**CreateCommerceCaseResponse**](CreateCommerceCaseResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_commerce_case

> <CommerceCaseResponse> get_commerce_case(merchant_id, commerce_case_id)

Get Commerce Case Details

This endpoint can be used to get a specific Commerce Case and all linked Checkouts.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CommerceCaseApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.

begin
  # Get Commerce Case Details
  result = api_instance.get_commerce_case(merchant_id, commerce_case_id)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->get_commerce_case: #{e}"
end
```

#### Using the get_commerce_case_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CommerceCaseResponse>, Integer, Hash)> get_commerce_case_with_http_info(merchant_id, commerce_case_id)

```ruby
begin
  # Get Commerce Case Details
  data, status_code, headers = api_instance.get_commerce_case_with_http_info(merchant_id, commerce_case_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CommerceCaseResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->get_commerce_case_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |

### Return type

[**CommerceCaseResponse**](CommerceCaseResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_commerce_cases

> <Array<CommerceCaseResponse>> get_commerce_cases(merchant_id, opts)

Get a list of Commerce Cases based on Search Parameters

This endpoint will provide a list of Commerce Cases based on the provided criteria. Not all parameters are required to be set. Results will be returned in descending creation time per default. 

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CommerceCaseApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
opts = {
  offset: 0, # Integer | The offset to load Items (Checkouts or Commerce-Cases, depending on the context) starting with 0.
  size: 10, # Integer | The number of Items (Checkouts or Commerce-Cases, depending on the context) loaded per page
  from_date: Time.parse('2022-11-10T13:34:23Z'), # Time | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX          All other formats may be ignored by the system. 
  to_date: Time.parse('2022-11-10T13:34:23Z'), # Time | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX All other formats may be ignored by the system. 
  commerce_case_id: '7a3444d3-f6ce-4b6e-b6c4-2486a160cf19', # String | Unique identifier of a Commerce Case.
  merchant_reference: 'your-checkout-6372', # String | Unique reference of the Checkout that is also returned for reporting and reconciliation purposes.
  merchant_customer_id: '1234', # String | Unique identifier for the customer.
  include_checkout_status: [PCPServerSDK::StatusCheckout::OPEN], # Array<StatusCheckout> | Filter your results by Checkout status so that only Checkouts with the specified statuses are returned.
  include_payment_channel: [PCPServerSDK::PaymentChannel::ECOMMERCE] # Array<PaymentChannel> | Filter your results by payment channel so that only Checkouts which reference transactions on the given channels are returned.
}

begin
  # Get a list of Commerce Cases based on Search Parameters
  result = api_instance.get_commerce_cases(merchant_id, opts)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->get_commerce_cases: #{e}"
end
```

#### Using the get_commerce_cases_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<CommerceCaseResponse>>, Integer, Hash)> get_commerce_cases_with_http_info(merchant_id, opts)

```ruby
begin
  # Get a list of Commerce Cases based on Search Parameters
  data, status_code, headers = api_instance.get_commerce_cases_with_http_info(merchant_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<CommerceCaseResponse>>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->get_commerce_cases_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **offset** | **Integer** | The offset to load Items (Checkouts or Commerce-Cases, depending on the context) starting with 0. | [optional][default to 0] |
| **size** | **Integer** | The number of Items (Checkouts or Commerce-Cases, depending on the context) loaded per page | [optional][default to 25] |
| **from_date** | **Time** | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX          All other formats may be ignored by the system.  | [optional] |
| **to_date** | **Time** | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX All other formats may be ignored by the system.  | [optional] |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. | [optional] |
| **merchant_reference** | **String** | Unique reference of the Checkout that is also returned for reporting and reconciliation purposes. | [optional] |
| **merchant_customer_id** | **String** | Unique identifier for the customer. | [optional] |
| **include_checkout_status** | [**Array&lt;StatusCheckout&gt;**](StatusCheckout.md) | Filter your results by Checkout status so that only Checkouts with the specified statuses are returned. | [optional] |
| **include_payment_channel** | [**Array&lt;PaymentChannel&gt;**](PaymentChannel.md) | Filter your results by payment channel so that only Checkouts which reference transactions on the given channels are returned. | [optional] |

### Return type

[**Array&lt;CommerceCaseResponse&gt;**](CommerceCaseResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_commerce_case

> update_commerce_case(merchant_id, commerce_case_id, patch_commerce_case_request)

Modify an existing Commerce Case.

This endpoint can be used to update or modify the customer object of a Commerce Case.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CommerceCaseApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
patch_commerce_case_request = PCPServerSDK::PatchCommerceCaseRequest.new # PatchCommerceCaseRequest | 

begin
  # Modify an existing Commerce Case.
  api_instance.update_commerce_case(merchant_id, commerce_case_id, patch_commerce_case_request)
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->update_commerce_case: #{e}"
end
```

#### Using the update_commerce_case_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_commerce_case_with_http_info(merchant_id, commerce_case_id, patch_commerce_case_request)

```ruby
begin
  # Modify an existing Commerce Case.
  data, status_code, headers = api_instance.update_commerce_case_with_http_info(merchant_id, commerce_case_id, patch_commerce_case_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CommerceCaseApi->update_commerce_case_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **patch_commerce_case_request** | [**PatchCommerceCaseRequest**](PatchCommerceCaseRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

