# PCPServerSDK::CreateCommerceCaseRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_reference** | **String** | Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes. | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **creation_date_time** | **Time** | Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD&#39;T&#39;HH:mm:ss&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm:ss+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm:ss-XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm&#39;Z&#39; * YYYY-MM-DD&#39;T&#39;HH:mm+XX:XX * YYYY-MM-DD&#39;T&#39;HH:mm-XX:XX  All other formats may be ignored by the system.  | [optional] |
| **checkout** | [**CreateCheckoutRequest**](CreateCheckoutRequest.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CreateCommerceCaseRequest.new(
  merchant_reference: customer-commerce-case-123,
  customer: null,
  creation_date_time: null,
  checkout: null
)
```

