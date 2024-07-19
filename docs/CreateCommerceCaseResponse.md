# PCPServerSDK::CreateCommerceCaseResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **commerce_case_id** | **String** | Unique ID of the Commerce Case. It can used to add additional Checkouts to the Commerce Case. | [optional] |
| **merchant_reference** | **String** | Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes. | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **checkout** | [**CreateCheckoutResponse**](CreateCheckoutResponse.md) |  | [optional] |
| **creation_date_time** | **Time** | Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX  All other formats may be ignored by the system.  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CreateCommerceCaseResponse.new(
  commerce_case_id: 707ef15b-7a0a-48f2-b7d8-c95103418a9c,
  merchant_reference: customer-commerce-case-123,
  customer: null,
  checkout: null,
  creation_date_time: null
)
```

