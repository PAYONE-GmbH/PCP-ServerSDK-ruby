# PCPServerSDK::InstallmentOption

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **installment_option_id** | **String** | Installment option Identifier. Use this in the Complete Payment for the selected installment option. |  |
| **number_of_payments** | **Integer** | The number of monthly payments for this installment. |  |
| **monthly_amount** | [**AmountOfMoney**](AmountOfMoney.md) | Monthly rate amount. |  |
| **last_rate_amount** | [**AmountOfMoney**](AmountOfMoney.md) | Last rate amount. |  |
| **effective_interest_rate** | **Integer** | Effective interest amount in percent with two decimals. |  |
| **nominal_interest_rate** | **Integer** | Nominal interest amount in percent with two decimals. |  |
| **total_amount** | [**AmountOfMoney**](AmountOfMoney.md) | Total rate amount. |  |
| **first_rate_date** | **String** | Due date of first rate. Format: YYYYMMDD |  |
| **credit_information** | [**LinkInformation**](LinkInformation.md) | Link with credit information. |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::InstallmentOption.new(
  installment_option_id: IOP_478d44fea0494eea86bc87f9e4a63328,
  number_of_payments: 12,
  monthly_amount: null,
  last_rate_amount: null,
  effective_interest_rate: 1209,
  nominal_interest_rate: 1199,
  total_amount: null,
  first_rate_date: null,
  credit_information: null
)
```

