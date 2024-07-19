# PCPServerSDK::PersonalInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_of_birth** | **String** | The date of birth of the customer of the recipient of the loan. Format YYYYMMDD | [optional] |
| **gender** | **String** | The gender of the customer, possible values are:  * MALE  * FEMALE  * UNKNOWN | [optional] |
| **name** | [**PersonalName**](PersonalName.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PersonalInformation.new(
  date_of_birth: null,
  gender: null,
  name: null
)
```

