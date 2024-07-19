# PCPServerSDK::AddressPersonal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **additional_info** | **String** | Second line of street or additional address information such as apartments and suits | [optional] |
| **city** | **String** | City | [optional] |
| **country_code** | **String** | ISO 3166-1 alpha-2 country code | [optional] |
| **house_number** | **String** | House number | [optional] |
| **state** | **String** | State (ISO 3166-2 subdivisions), only if country&#x3D;US, CA, CN, JP, MX, BR, AR, ID, TH, IN. | [optional] |
| **street** | **String** | Street name | [optional] |
| **zip** | **String** | Zip code | [optional] |
| **name** | [**PersonalName**](PersonalName.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::AddressPersonal.new(
  additional_info: Apartment 203,
  city: Kiel,
  country_code: DE,
  house_number: 3,
  state: MX,
  street: Coral Avenue,
  zip: 1234,
  name: null
)
```

