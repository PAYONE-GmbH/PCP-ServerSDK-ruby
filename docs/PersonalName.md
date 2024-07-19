# PCPServerSDK::PersonalName

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** | Given name(s) or first name(s) of the customer | [optional] |
| **surname** | **String** | Surname(s) or last name(s) of the customer | [optional] |
| **title** | **String** | Title of customer | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PersonalName.new(
  first_name: Wile,
  surname: E. Coyote,
  title: Dr.
)
```

