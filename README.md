# PAYONE Commerce Platform Ruby SDK

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=PAYONE-GmbH_PCP-ServerSDK-ruby&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=PAYONE-GmbH_PCP-ServerSDK-ruby)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=PAYONE-GmbH_PCP-ServerSDK-ruby&metric=coverage)](https://sonarcloud.io/summary/new_code?id=PAYONE-GmbH_PCP-ServerSDK-ruby)
![PyPI - Version](https://img.shields.io/pypi/v/pcp_serversdk_ruby)
![PyPI - Downloads](https://img.shields.io/pypi/dw/pcp_serversdk_ruby)

Welcome to the Ruby SDK for the PAYONE Commerce Platform! This repository contains a powerful, easy-to-use software development kit (SDK) designed to simplify the integration of online payment processing into your applications.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [General](#general)
  - [Error Handling](#error-handling)
  - [Client Side](#client-side)
  - [Apple Pay](#apple-pay)
- [Demo App](#demo-app)
- [Contributing](#contributing)
- [Releasing the library](#releasing-the-library)
  - [Preparing the Release](#preparing-the-release)
  - [Changelog Generation with Conventional Changelog](#changelog-generation-with-conventional-changelog)
  - [Merging the Release Branch](#merging-the-release-branch)
  - [GitHub Action for Release](#github-action-for-release)
  - [Optional: Creating a GitHub Release](#optional-creating-a-github-release)
- [License](#license)

## Features

- **Easy Integration**: Seamlessly integrate online payment processing into your application.
- **Secure Transactions**: Built with security best practices to ensure safe transactions.
- **Extensive Documentation**: Detailed documentation to help you get started quickly.
- **Open Source**: Fully open source and community-driven.

## Installation

```sh
gem install pcp-server-ruby-sdk
```

**[back to top](#table-of-contents)**

## Usage

### General

To use this SDK you need to construct a `PCPServerSDK::CommunicatorConfiguration` which encapsulate everything needed to connect to the PAYONE Commerce Platform.

```rb
require 'pcp-server-ruby-sdk'

api_key = ENV['API_KEY']
api_secret = ENV['API_SECRET']

communicator_configuration = PCPServerSDK::CommunicatorConfiguration.new(
  api_key,
  api_secret,
  'https://api.preprod.commerce.payone.com'
)
```

With the configuration you can create an API client for each reource you want to interact with. For example to create a commerce case you can use the `PCPServerSDK::Endpoints::CommerceCaseApiClient`.

```rb
require 'pcp-server-ruby-sdk'

client = PCPServerSDK::Endpoints::CommerceCaseApiClient.new(communicator_configuration)
```

All payloads and reponses are availabe as ruby classes within the `pcp-server-ruby-sdk` package. The serialization and deserialization is handled by the SDK internally. For example, to create an empty commerce case you can pass a `PCPServerSDK::Models::CreateCommerceCaseRequest` instance:

```rb
createCommerceCaseRequest = PCPServerSDK::Models::CreateCommerceCaseRequest.new
createCommerceCaseResponse = client.create_commerce_case_request('merchant_id', createCommerceCaseRequest);
```

The models directly map to the API as described in [PAYONE Commerce Platform API Reference](https://docs.payone.com/pcp/commerce-platform-api). For an in depth example you can take a look at the [demo app](#demo-app).

### Error Handling

When making a request any client may throw a `PCPServerSDK::Errors::ApiException`. There two subtypes of this exception:

- `PCPServerSDK::Errors::ApiErrorReponseException`: This exception is thrown when the API returns an well-formed error response. The given errors are deserialized into `PCPServerSDK::Models::APIError` objects which are availble via the `get_errors` method on the exception. They usually contain useful information about what is wrong in your request or the state of the resource.
- `PCPServerSDK::Errors::ApiResponseRetrievalException`: This exception is a catch-all exception for any error that cannot be turned into a helpful error response. This includes malformed responses or unknown responses.

Network errors are not wrap, you can should handle the standard `IOExeption`.

### Client Side

For most [payment methods](https://docs.payone.com/pcp/commerce-platform-payment-methods) some information from the client is needed, e.g. payment information given by Apple when a payment via ApplePay suceeds. PAYONE provides client side SDKs which helps you interact the third party payment providers. You can find the SDKs under the [PAYONE GitHub organization](https://github.com/PAYONE-GmbH). Either way ensure to never store or even send credit card information to your server. The PAYONE Commerce Platform never needs access to the credit card information. The client side is responsible for safely retrieving a credit card token. This token must be used with this SDK.

### Apple Pay

When a client is successfully made a payment via ApplePay it receives a [ApplePayPayment](https://developer.apple.com/documentation/apple_pay_on_the_web/applepaypayment). This structure is accessible as the `PCPServerSDK::Models::ApplePayPayment` class. You can use the `PCPServerSDK::Transformer::ApplePayTransformer` to map an `PCPServerSDK::Models::ApplePayPayment` to a `PCPServerSDK::Models::MobilePaymentMethodSpecificInput` which can be used for payment executions or order requests. The transformer has a static method `PCPServerSDK::Transformer::transformApplePayPaymentToMobilePaymentMethodSpecificInput` which takes an `PCPServerSDK::Models::ApplePayPayment` and returns a `PCPServerSDK::Models::MobilePaymentMethodSpecificInput`. The transformer does not check if the response is complete, if anything is missing the field will be set to `null`.

```rb
require 'pcp-server-ruby-sdk'

payment = PCPServerSDK::Models::ApplePayPayment.new(get_json_string_from_request_somehow)
# input is of type PCPServerSDK::Models::MobilePaymentMethodSpecificInput
input = PCPServerSDK::Transformer::transformApplePayPaymentToMobilePaymentMethodSpecificInput(payment)
```

**[back to top](#table-of-contents)**

## Demo App

```sh
API_KEY=api_key API_SECRET=api_secret MERCHANT_ID=123 COMMERCE_CASE_ID=234 CHECKOUT_ID=345 ./scripts.sh run
```

**[back to top](#table-of-contents)**

## Contributing

See [Contributing](./CONTRIBUTING.md)

**[back to top](#table-of-contents)**

## Releasing the library

### Preparing the Release

- Checkout develop branch
- Create release branch (release/0.1.0)

```sh
git checkout -b release/0.1.0
```

- Run `scripts.sh` script to set correct version

```sh
./scripts.sh version 0.1.0
```

### Changelog Generation with Conventional Changelog

When calling the `./scripts.sh version` script, the changelog will now be generated automatically using [conventional-changelog](https://github.com/conventional-changelog/conventional-changelog).

1. **Conventional Commit Messages**:

   - Ensure all commit messages follow the conventional commit format, which is crucial for automatic changelog generation.
   - Commit messages should be in the format: `type(scope): subject`.

2. **Enforcing Commit Messages**:

   - We enforce conventional commit messages using [Lefthook](https://github.com/evilmartians/lefthook) with [commitlint](https://github.com/conventional-changelog/commitlint).
   - This setup ensures that all commit messages are validated before they are committed.

3. **Automatic Changelog Generation**:

   - The `./scripts.sh version` script will automatically generate and update the `CHANGELOG.md` file.
   - After running the script, review the updated changelog to ensure accuracy before proceeding with the release.

### Merging the Release Branch

- Create PR on `develop` branch
- Merge `develop` in `main` branch

### GitHub Action for Release

After successfully merging all changes to the `main` branch, an admin can trigger a GitHub Action to finalize and publish the release. This action ensures that the release process is automated, consistent, and deploys the new release from the `main` branch.

**Triggering the GitHub Action**:

- Only admins can trigger the release action.
- Ensure that all changes are committed to the `main` branch.
- Navigate to the Actions tab on your GitHub repository and manually trigger the release action for the `main` branch.

### Optional: Creating a GitHub Release

Once the release has been published to PyPi, developers can start using the latest version of the SDK. However, if you want to make the release more visible and include detailed release notes, you can optionally create a GitHub release.

1. **Navigate to the Releases Page**: Go to the "Releases" section of your repository on GitHub.
2. **Draft a New Release**: Click "Draft a new release".
3. **Tag the Release**: Select the version tag that corresponds to the version you just published on npm (e.g., `v0.1.0`).
4. **Release Title**: Add a descriptive title for the release (e.g., `v0.1.0 - Initial Release`).
5. **Auto-Generated Release Notes**: GitHub can automatically generate release notes based on merged pull requests and commit history. You can review these notes, adjust the content, and highlight important changes.
6. **Publish the Release**: Once you're satisfied with the release notes, click "Publish release".

Creating a GitHub release is optional, but it can provide additional context and visibility for your users. For detailed guidance, refer to the [GitHub documentation on managing releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository).

**[back to top](#table-of-contents)**

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

---

Thank you for using our SDK for Online Payments! If you have any questions or need further assistance, feel free to open an issue or contact us.
