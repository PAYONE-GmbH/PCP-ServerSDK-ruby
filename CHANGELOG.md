# [1.3.0](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v1.2.0...v1.3.0) (2025-07-10)

### Features

* feat: add auth client ([c8fd009b11a8ec3416a33ecab949ec2c51406e7e](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/c8fd009b11a8ec3416a33ecab949ec2c51406e7e))

# [1.2.0](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v1.1.0...v1.2.0) (2025-05-26)

### Documentation

* docs: clarify comment for category attribute in APIError class ([ccafb6db2bc474bb07a30a1fda7ff6e730a8137d](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/ccafb6db2bc474bb07a30a1fda7ff6e730a8137d))
* docs: improve comment clarity for tax_amount_per_unit attribute in OrderLineDetailsInput model ([37fcf28f22a1a9ccf93689c21c07f06d2e3249a8](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/37fcf28f22a1a9ccf93689c21c07f06d2e3249a8))
* docs: update docs ([a4b33ef94dc183847f5be0288c84312c0dd8cfba](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/a4b33ef94dc183847f5be0288c84312c0dd8cfba))
* docs: update README with new badge links and API version ([c69507cd4b9da665fb686576c0900570462fc1bf](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/c69507cd4b9da665fb686576c0900570462fc1bf))

### Features

* feat: add BusinessRelation class and update customer model to use it ([68ab9fc5c41aad7f3f967b75b1ecdd0ac02cba63](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/68ab9fc5c41aad7f3f967b75b1ecdd0ac02cba63))
* feat: add CustomerAccount class and integrate it into Customer class ([ee1600ec78d66498cc758b4c931f510dd3ffb4c7](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/ee1600ec78d66498cc758b4c931f510dd3ffb4c7))
* feat: add fraud_net_id attribute to RedirectPaymentProduct840SpecificInput model ([27ec17cce2fb42eb37116790ce2dd106502487c0](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/27ec17cce2fb42eb37116790ce2dd106502487c0))
* feat: add RecurringPaymentSequenceIndicator class and update CardRecurrenceDetails to use it ([e2507f4328a297dc700fa1635029a1599fa58101](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/e2507f4328a297dc700fa1635029a1599fa58101))
* feat: implement ActionType class and update MerchantAction to use it ([8e259dc45f4e20ea0a10a351a3abdc86926b91f1](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/8e259dc45f4e20ea0a10a351a3abdc86926b91f1))
* feat: implement AvsResult enum class and update CardFraudResults to use it ([c0a40cc08aa878afaae93851be1619907e7c5e86](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/c0a40cc08aa878afaae93851be1619907e7c5e86))

# [1.1.0](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v1.0.0...v1.1.0) (2025-03-14)

### Documentation

* docs: update readme ([39af578246533fda6b3bed100a4fbf66371885b7](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/39af578246533fda6b3bed100a4fbf66371885b7))

### Features

* feat: implement api level 1.28.0 ([b26df0bc2da08cd900775c45bd64f5db120ede0a](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/b26df0bc2da08cd900775c45bd64f5db120ede0a))

## [0.0.1](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v0.0.6...v0.0.1) (2024-09-02)

### Bug Fixes

* fix: update version script to actually set the version ([9193d60c4e3f3160ef628c8e093573394a802bc4](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/9193d60c4e3f3160ef628c8e093573394a802bc4))

### Features

* feat: add apple pay transformer and tests ([110182da3735202d0d3ee2b6bde2f57739221d49](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/110182da3735202d0d3ee2b6bde2f57739221d49))

## [0.0.1](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v0.0.5...v0.0.1) (2024-08-29)

## [0.0.1](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v0.0.4...v0.0.1) (2024-08-28)

## [0.0.1](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/compare/v0.1.0...v0.0.1) (2024-08-28)

### Bug Fixes

* fix: build gem before publishing it ([6ac4ba2e0c49ddcee2fa85b519482fe639607b41](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/6ac4ba2e0c49ddcee2fa85b519482fe639607b41))

## 0.0.1 (2024-08-28)

### Bug Fixes

* fix: correclty name ctest file in order to get executed ([d76fd3f8865c7fdc261c790e5bae386b5670141a](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/d76fd3f8865c7fdc261c790e5bae386b5670141a))
* fix: fix sonarcloud action ([090556413fa6d9cf21774b32f14805583595d602](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/090556413fa6d9cf21774b32f14805583595d602))
* fix: make coverage path relative to root directory ([c7a071cd2afa607f8497b3cd811408e3eaf64c97](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/c7a071cd2afa607f8497b3cd811408e3eaf64c97))
* fix: set correct name in package.json ([718c816b4a075d068f67392b877f38fe5f4adea7](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/718c816b4a075d068f67392b877f38fe5f4adea7))

### Documentation

* docs: adjust readme according to other sdks ([8376e921b8cc77909b2bf20c0661dfca8403d07f](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/8376e921b8cc77909b2bf20c0661dfca8403d07f))

### Features

* feat: add basic sdk implementation ([3f12df45d97d8bfbf24be44c391a64fb43280427](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/3f12df45d97d8bfbf24be44c391a64fb43280427))
* feat: add example app ([d9d3f77c42e43f0c3c3ddc8df62e30762733e2c3](https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby/commit/d9d3f77c42e43f0c3c3ddc8df62e30762733e2c3))

## 0.0.1 (2024-08-28)

### Bug Fixes

* fix: correclty name ctest file in order to get executed ([d76fd3f8865c7fdc261c790e5bae386b5670141a](https://github.com/PAYONE-GmbH/PCP-ServerSDK-DotNet/commit/d76fd3f8865c7fdc261c790e5bae386b5670141a))
* fix: fix sonarcloud action ([090556413fa6d9cf21774b32f14805583595d602](https://github.com/PAYONE-GmbH/PCP-ServerSDK-DotNet/commit/090556413fa6d9cf21774b32f14805583595d602))
* fix: make coverage path relative to root directory ([c7a071cd2afa607f8497b3cd811408e3eaf64c97](https://github.com/PAYONE-GmbH/PCP-ServerSDK-DotNet/commit/c7a071cd2afa607f8497b3cd811408e3eaf64c97))

### Features

* feat: add basic sdk implementation ([3f12df45d97d8bfbf24be44c391a64fb43280427](https://github.com/PAYONE-GmbH/PCP-ServerSDK-DotNet/commit/3f12df45d97d8bfbf24be44c391a64fb43280427))
* feat: add example app ([d9d3f77c42e43f0c3c3ddc8df62e30762733e2c3](https://github.com/PAYONE-GmbH/PCP-ServerSDK-DotNet/commit/d9d3f77c42e43f0c3c3ddc8df62e30762733e2c3))

