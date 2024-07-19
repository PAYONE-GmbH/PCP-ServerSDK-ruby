# PCPServerSDK::CardPaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization_mode** | [**AuthorizationMode**](AuthorizationMode.md) |  | [optional] |
| **recurring** | [**CardRecurrenceDetails**](CardRecurrenceDetails.md) |  | [optional] |
| **payment_processing_token** | **String** | ID of the token to use to create the payment. | [optional] |
| **reporting_token** | **String** | Token to identify the card in the reporting. | [optional][readonly] |
| **transaction_channel** | [**TransactionChannel**](TransactionChannel.md) |  | [optional] |
| **unscheduled_card_on_file_requestor** | [**UnscheduledCardOnFileRequestor**](UnscheduledCardOnFileRequestor.md) |  | [optional] |
| **unscheduled_card_on_file_sequence_indicator** | [**UnscheduledCardOnFileSequenceIndicator**](UnscheduledCardOnFileSequenceIndicator.md) |  | [optional] |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **card** | [**CardInfo**](CardInfo.md) |  | [optional] |
| **return_url** | **String** | The URL that the customer is redirect to after the payment flow has finished. You can add any number of key value pairs in the query string that, for instance help you to identify the customer when they return to your site. Please note that we will also append some additional key value pairs that will also help you with this identification process. Note: The provided URL should be absolute and contain the protocol to use, e.g. http:// or https://. For use on mobile devices a custom protocol can be used in the form of protocol://. This protocol must be registered on the device first. URLs without a protocol will be rejected. | [optional] |
| **card_on_file_recurring_frequency** | **String** | Period of payment occurrence for recurring and installment payments. Allowed values: * Yearly * Quarterly * Monthly  * Weekly * Daily Supported soon | [optional] |
| **card_on_file_recurring_expiration** | **String** | The end date of the last scheduled payment in a series of transactions. Format YYYYMMDD Supported soon | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CardPaymentMethodSpecificInput.new(
  authorization_mode: null,
  recurring: null,
  payment_processing_token: 0ca037cc-9079-4df7-8f6f-f2a3443ee521,
  reporting_token: 12a037cc-833d-8b45-8f6f-11c34171f4e1,
  transaction_channel: null,
  unscheduled_card_on_file_requestor: null,
  unscheduled_card_on_file_sequence_indicator: null,
  payment_product_id: 840,
  card: null,
  return_url: https://secure.ogone.com/ncol/test/displayparams.asp,
  card_on_file_recurring_frequency: null,
  card_on_file_recurring_expiration: null
)
```

