# PCPServerSDK::ProcessingMandateInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_account_iban** | [**BankAccountInformation**](BankAccountInformation.md) |  |  |
| **recurrence_type** | [**MandateRecurrenceType**](MandateRecurrenceType.md) |  |  |
| **unique_mandate_reference** | **String** | The unique identifier of the mandate |  |
| **date_of_signature** | **String** | The date of signature of the mandate. Format YYYYMMDD |  |
| **creditor_id** | **String** | Your unique creditor identifier. |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ProcessingMandateInformation.new(
  bank_account_iban: null,
  recurrence_type: null,
  unique_mandate_reference: your-mandate-id,
  date_of_signature: 20220101,
  creditor_id: DE98ZZZ09999999999
)
```

