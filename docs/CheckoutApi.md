# PCPServerSDK::CheckoutApi

All URIs are relative to *https://commerce-api.payone.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_checkout**](CheckoutApi.md#create_checkout) | **POST** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts | Add a Checkout to an existing Commerce Case |
| [**delete_checkout**](CheckoutApi.md#delete_checkout) | **DELETE** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId} | Delete a Checkout |
| [**get_checkout**](CheckoutApi.md#get_checkout) | **GET** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId} | Get Checkout Details |
| [**get_checkouts**](CheckoutApi.md#get_checkouts) | **GET** /v1/{merchantId}/checkouts | Get a list of Checkouts based on Search Parameters |
| [**update_checkout**](CheckoutApi.md#update_checkout) | **PATCH** /v1/{merchantId}/commerce-cases/{commerceCaseId}/checkouts/{checkoutId} | Modify a Checkout |


## create_checkout

> <CreateCheckoutResponse> create_checkout(merchant_id, commerce_case_id, create_checkout_request)

Add a Checkout to an existing Commerce Case

This endpoint can be used to add a new Checkout in combination with an Order to an existing Commerce Case. The Order can either be directly executed or the paymentMethodSpecificInput can also be stored for a later execution over the OrderManagementCheckout Action or Payment Execution endpoint.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CheckoutApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
create_checkout_request = PCPServerSDK::CreateCheckoutRequest.new # CreateCheckoutRequest | 

begin
  # Add a Checkout to an existing Commerce Case
  result = api_instance.create_checkout(merchant_id, commerce_case_id, create_checkout_request)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->create_checkout: #{e}"
end
```

#### Using the create_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreateCheckoutResponse>, Integer, Hash)> create_checkout_with_http_info(merchant_id, commerce_case_id, create_checkout_request)

```ruby
begin
  # Add a Checkout to an existing Commerce Case
  data, status_code, headers = api_instance.create_checkout_with_http_info(merchant_id, commerce_case_id, create_checkout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreateCheckoutResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->create_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **create_checkout_request** | [**CreateCheckoutRequest**](CreateCheckoutRequest.md) |  |  |

### Return type

[**CreateCheckoutResponse**](CreateCheckoutResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_checkout

> delete_checkout(merchant_id, commerce_case_id, checkout_id)

Delete a Checkout

This endpoint can be used to delete an unused Checkout.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CheckoutApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout

begin
  # Delete a Checkout
  api_instance.delete_checkout(merchant_id, commerce_case_id, checkout_id)
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->delete_checkout: #{e}"
end
```

#### Using the delete_checkout_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id)

```ruby
begin
  # Delete a Checkout
  data, status_code, headers = api_instance.delete_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->delete_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_checkout

> <CheckoutResponse> get_checkout(merchant_id, commerce_case_id, checkout_id)

Get Checkout Details

This endpoint can be used to get a Checkout.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CheckoutApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout

begin
  # Get Checkout Details
  result = api_instance.get_checkout(merchant_id, commerce_case_id, checkout_id)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->get_checkout: #{e}"
end
```

#### Using the get_checkout_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckoutResponse>, Integer, Hash)> get_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id)

```ruby
begin
  # Get Checkout Details
  data, status_code, headers = api_instance.get_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckoutResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->get_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |

### Return type

[**CheckoutResponse**](CheckoutResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_checkouts

> <CheckoutsResponse> get_checkouts(merchant_id, opts)

Get a list of Checkouts based on Search Parameters

This endpoint will provide a list of Checkouts based on the provided criteria. Not all parameters are required to be set. Results will be returned in descending creation time per default. Only up to the first 10,000 results will be returned. 

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CheckoutApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
opts = {
  offset: 0, # Integer | The offset to load Items (Checkouts or Commerce-Cases, depending on the context) starting with 0.
  size: 10, # Integer | The number of Items (Checkouts or Commerce-Cases, depending on the context) loaded per page
  from_date: Time.parse('2022-11-10T13:34:23Z'), # Time | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX          All other formats may be ignored by the system. 
  to_date: Time.parse('2022-11-10T13:34:23Z'), # Time | Date and time in RFC3339 format after which Items (Checkouts or Commerce-Cases, depending on the context) should be included in the request. Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX All other formats may be ignored by the system. 
  from_checkout_amount: 1000, # Integer | Minimum monetary value of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_checkout_amount: 1000, # Integer | Maximum monetary value of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  from_open_amount: 1000, # Integer | Minimum open amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_open_amount: 1000, # Integer | Maximum open amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  from_collected_amount: 1000, # Integer | Minimum collected amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_collected_amount: 1000, # Integer | Maximum collected amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  from_cancelled_amount: 1000, # Integer | Minimum cancelled amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_cancelled_amount: 1000, # Integer | Maximum cancelled amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  from_refund_amount: 1000, # Integer | Minimum refunded amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_refund_amount: 1000, # Integer | Maximum refunded amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  from_chargeback_amount: 1000, # Integer | Minimum chargeback amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  to_chargeback_amount: 1000, # Integer | Maximum chargeback amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals.
  checkout_id: '7a3444d3-f6ce-4b6e-b6c4-2486a160cf19', # String | Unique identifier of a Checkout
  merchant_reference: 'your-checkout-6372', # String | Unique reference of the Checkout that is also returned for reporting and reconciliation purposes.
  merchant_customer_id: '1234', # String | Unique identifier for the customer.
  include_payment_product_id: [840], # Array<Integer> | Filter your results by payment product ID so that only Checkouts containing a Payment Execution with one of the specified payment product IDs are returned.
  include_checkout_status: [PCPServerSDK::StatusCheckout::OPEN], # Array<StatusCheckout> | Filter your results by Checkout status so that only Checkouts with the specified statuses are returned.
  include_extended_checkout_status: [PCPServerSDK::ExtendedCheckoutStatus::OPEN], # Array<ExtendedCheckoutStatus> | Filter your results by extended Checkout status so that only Checkouts with the specified statuses are returned.
  include_payment_channel: [PCPServerSDK::PaymentChannel::ECOMMERCE], # Array<PaymentChannel> | Filter your results by payment channel so that only Checkouts which reference transactions on the given channels are returned.
  payment_reference: 'Reference-4172', # String | Filter your results by the merchantReference of the paymentExecution or paymentInformation.
  payment_id: '664423132', # String | Filter your results by the paymentExecutionId, paymentInformationId or the id of the payment.
  first_name: 'Sinclair', # String | Filter your results by the customer first name. It is also possible to filter by the first name from the shipping address.
  surname: 'Müller', # String | Filter your results by the customer surname. It is also possible to filter by the surname from the shipping address.
  email: 'Sinclair.Müller@example.com', # String | Filter your results by the customer email address.
  phone_number: '+1234567890', # String | Filter your results by the customer phone number.
  date_of_birth: '20041101', # String | Filter your results by the date of birth. Format YYYYMMDD
  company_information: 'Sinclair's company name' # String | Filter your results by the name of the company.
}

begin
  # Get a list of Checkouts based on Search Parameters
  result = api_instance.get_checkouts(merchant_id, opts)
  p result
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->get_checkouts: #{e}"
end
```

#### Using the get_checkouts_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckoutsResponse>, Integer, Hash)> get_checkouts_with_http_info(merchant_id, opts)

```ruby
begin
  # Get a list of Checkouts based on Search Parameters
  data, status_code, headers = api_instance.get_checkouts_with_http_info(merchant_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckoutsResponse>
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->get_checkouts_with_http_info: #{e}"
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
| **from_checkout_amount** | **Integer** | Minimum monetary value of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_checkout_amount** | **Integer** | Maximum monetary value of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **from_open_amount** | **Integer** | Minimum open amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_open_amount** | **Integer** | Maximum open amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **from_collected_amount** | **Integer** | Minimum collected amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_collected_amount** | **Integer** | Maximum collected amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **from_cancelled_amount** | **Integer** | Minimum cancelled amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_cancelled_amount** | **Integer** | Maximum cancelled amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **from_refund_amount** | **Integer** | Minimum refunded amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_refund_amount** | **Integer** | Maximum refunded amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **from_chargeback_amount** | **Integer** | Minimum chargeback amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **to_chargeback_amount** | **Integer** | Maximum chargeback amount of the Checkouts that shall be included in the response. Amount in cents always having 2 decimals. | [optional] |
| **checkout_id** | **String** | Unique identifier of a Checkout | [optional] |
| **merchant_reference** | **String** | Unique reference of the Checkout that is also returned for reporting and reconciliation purposes. | [optional] |
| **merchant_customer_id** | **String** | Unique identifier for the customer. | [optional] |
| **include_payment_product_id** | [**Array&lt;Integer&gt;**](Integer.md) | Filter your results by payment product ID so that only Checkouts containing a Payment Execution with one of the specified payment product IDs are returned. | [optional] |
| **include_checkout_status** | [**Array&lt;StatusCheckout&gt;**](StatusCheckout.md) | Filter your results by Checkout status so that only Checkouts with the specified statuses are returned. | [optional] |
| **include_extended_checkout_status** | [**Array&lt;ExtendedCheckoutStatus&gt;**](ExtendedCheckoutStatus.md) | Filter your results by extended Checkout status so that only Checkouts with the specified statuses are returned. | [optional] |
| **include_payment_channel** | [**Array&lt;PaymentChannel&gt;**](PaymentChannel.md) | Filter your results by payment channel so that only Checkouts which reference transactions on the given channels are returned. | [optional] |
| **payment_reference** | **String** | Filter your results by the merchantReference of the paymentExecution or paymentInformation. | [optional] |
| **payment_id** | **String** | Filter your results by the paymentExecutionId, paymentInformationId or the id of the payment. | [optional] |
| **first_name** | **String** | Filter your results by the customer first name. It is also possible to filter by the first name from the shipping address. | [optional] |
| **surname** | **String** | Filter your results by the customer surname. It is also possible to filter by the surname from the shipping address. | [optional] |
| **email** | **String** | Filter your results by the customer email address. | [optional] |
| **phone_number** | **String** | Filter your results by the customer phone number. | [optional] |
| **date_of_birth** | **String** | Filter your results by the date of birth. Format YYYYMMDD | [optional] |
| **company_information** | **String** | Filter your results by the name of the company. | [optional] |

### Return type

[**CheckoutsResponse**](CheckoutsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_checkout

> update_checkout(merchant_id, commerce_case_id, checkout_id, patch_checkout_request)

Modify a Checkout

This endpoint can be used to update or modify the data of a Checkout.

### Examples

```ruby
require 'time'
require 'PCP-server-Ruby-SDK'

api_instance = PCPServerSDK::CheckoutApi.new
merchant_id = '3241' # String | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant.
commerce_case_id = 'commerce_case_id_example' # String | Unique identifier of a Commerce Case.
checkout_id = 'checkout_id_example' # String | Unique identifier of a Checkout
patch_checkout_request = PCPServerSDK::PatchCheckoutRequest.new # PatchCheckoutRequest | 

begin
  # Modify a Checkout
  api_instance.update_checkout(merchant_id, commerce_case_id, checkout_id, patch_checkout_request)
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->update_checkout: #{e}"
end
```

#### Using the update_checkout_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> update_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id, patch_checkout_request)

```ruby
begin
  # Modify a Checkout
  data, status_code, headers = api_instance.update_checkout_with_http_info(merchant_id, commerce_case_id, checkout_id, patch_checkout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue PCPServerSDK::ApiError => e
  puts "Error when calling CheckoutApi->update_checkout_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_id** | **String** | The merchantId identifies uniquely the merchant. A Checkout has exactly one merchant. |  |
| **commerce_case_id** | **String** | Unique identifier of a Commerce Case. |  |
| **checkout_id** | **String** | Unique identifier of a Checkout |  |
| **patch_checkout_request** | [**PatchCheckoutRequest**](PatchCheckoutRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

