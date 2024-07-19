# PCPServerSDK::APIError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | Error code |  |
| **category** | **String** | Category the error belongs to. The category should give an indication of the type of error you are dealing with. Possible values: * DIRECT_PLATFORM_ERROR - indicating that a functional error has occurred in the platform. * PAYMENT_PLATFORM_ERROR - indicating that a functional error has occurred in the payment platform. * IO_ERROR - indicating that a technical error has occurred within the payment platform or between the payment platform and third party systems. * COMMERCE_PLATFORM_ERROR - indicating an error originating from the Commerce Platform. * COMMERCE_PORTAL_BACKEND_ERROR - indicating an error originating from the Commerce Portal Backend. | [optional] |
| **http_status_code** | **Integer** | HTTP status code for this error that can be used to determine the type of error | [optional] |
| **id** | **String** | ID of the error. This is a short human-readable message that briefly describes the error. | [optional] |
| **message** | **String** | Human-readable error message that is not meant to be relayed to customer as it might tip off people who are trying to commit fraud | [optional] |
| **property_name** | **String** | Returned only if the error relates to a value that was missing or incorrect.  Contains a location path to the value as a JSonata query.  Some common examples: * a.b selects the value of property b of root property a, * a[1] selects the first element of the array in root property a, * a[b&#x3D;&#39;some value&#39;] selects all elements of the array in root property a that have a property b with value &#39;some value&#39;. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::APIError.new(
  error_code: 50001130,
  category: PAYMENT_PLATFORM_ERROR,
  http_status_code: 404,
  id: general-error-technical-fault-internal,
  message: Authorisation declined,
  property_name: paymentId
)
```

