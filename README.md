# tc_mobile_react_native_demo

This is a Cucumber based sample test suite and framework utilizing the TestCentricity™ For Mobile gem and a screen-object
model architecture for native mobile app functional testing of the [Sauce Labs React Native Demo app](https://github.com/saucelabs/my-demo-app-rn). The tests in
this example project are designed to support testing of [version 1.3.0](https://github.com/saucelabs/my-demo-app-rn/releases/tag/v1.3.0) of the Sauce Labs React Native Demo app.

![React Native Demo app](https://raw.githubusercontent.com/TestCentricity/tc_mobile_react_native_demo/main/.github/images/RN_Demo_app.png)

The primary purpose of this example test suite and framework is to demonstrate how to implement a cross platform comprehensive
automated testing solution for a React Native iOS and Android mobile app using Cucumber, Appium, and the TestCentricity™ For
Mobile gem. This test suite includes scenarios for interactive with and validating the following functionality:
  * Choosing products and adding them to a shopping cart
  * Completing orders once shipping and payment data have been provided
  * Populating forms with data
  * Navigation metaphors
  * Verification of multiple properties of multiple screen UI elements
  * Deep linking
  * Drawing
  * WebViews
  * Logging in using Biometrics (Face ID on iOS only)
  * Alert modals


## Gem Dependencies:

cucumber  [![Gem Version](https://badge.fury.io/rb/cucumber.svg)](https://badge.fury.io/rb/cucumber)

testcentricity_mobile  [![Gem Version](https://badge.fury.io/rb/testcentricity_mobile.svg)](https://badge.fury.io/rb/testcentricity_mobile)


## Supporting Documentation

[TestCentricity For Mobile Framework - testcentricity_mobile gem](https://rubygems.org/gems/testcentricity_mobile)

[TestCentricity For Mobile - documentation](http://www.rubydoc.info/gems/testcentricity_mobile/)


## Prerequisites to running tests:

The `tc_mobile_react_native_demo` test automation project supports running tests on iOS and Android simulators or physical
devices. The capabilities profiles for running tests against an iPhone or Android phone are stored in the test data asset
file located at `/config/test_data/data.yml`.

    📁 tc_mobile_react_native_demo
     ├── 📁 config
     │   ├── 📁 test_data
     │   │    └── 📄 data.yml
     │   └── 📄 cucumber.yml
     ├── 📁 doc
     └── 📁 features

In order for Cucumber to execute the features and scenarios in the `tc_mobile_react_native_demo` test automation project,
you must install Appium, XCode, the iOS version-specific device simulators for XCode, Android Studio, and the desired Android
version-specific virtual device emulators. The capabilities profiles in `data.yml`file are currently set to the following:

| Mobile device    | OS version ('appium:platformVersion':) | Device name ('appium:deviceName': / 'appium:avd':) |
|------------------|----------------------------------------|----------------------------------------------------|
| `:iPhone`        | '17.2'                                 | 'iPhone 13 Pro Max'                                |
| `:android_phone` | '12.0'                                 | 'Pixel_5_API_31'                                   |

If you prefer to run tests against mobile devices using simulators other than the ones already preconfigured, you can
edit the capabilities profiles in the `data.yml` file. Refer to [**section 8.2 (Connecting to Locally Hosted Simulators or Physical Devices)**](https://www.rubydoc.info/gems/testcentricity_mobile#connecting-to-locally-hosted-simulators-or-physical-devices)
of the TestCentricity Mobile gem documentation for information on specifying the desired capabilities for mobile simulators
and devices.

You will also need to download version 1.3.0 of the iOS (`.app` and/or `.ipa`) and Android (`.apk`) apps to your workstation,
and then edit the capabilities profiles in the `data.yml` file to change file path value associated with the corresponding
`:'appium:app':` keys to the actual file paths where the downloaded app files reside locally.


## Known Issues

### iOS System Level Dialogs

Refer to [this wiki page](https://github.com/TestCentricity/testcentricity_mobile/wiki/XCUItest-driver-bug-impacts-iOS-dialogs-managed-by-com.apple.springboard) for information on a bug with the latest versions of the XCUItest driver that affects
Appium's ability to interact with and verify iOS system level modal dialogs. If you are attempting to run these tests using
Appium 2.x with a version of the XCUItest driver between version 6.0.0 and the current version 7.15.0, all tests that
result in an iOS system level dialog to appear will fail. The affected dialogs are shown below:

![iOS System Dialogs](https://raw.githubusercontent.com/TestCentricity/tc_mobile_react_native_demo/main/.github/images/iOS_System_Dialogs.jpg)


### iPhone Dynamic Island

If you choose to run these tests on a newer iPhone 14 Pro or 15 series simulator or device, a number of tests may fail due to
the screen header image being obscured by the iPhone's "Dynamic Island". As described in the release notes for [version 1.3.0](https://github.com/saucelabs/my-demo-app-rn/releases/tag/v1.3.0)
of the Sauce Labs React Native Demo app, a long press (minimal half a second) on the header image is required to clear the
sort state, cart contents, sign in data, and biometrics settings when establishing the base preconditions for many of the
test scenarios. This problem can be avoided by running the tests on iPhones with a fixed camera notch (which does not obscure
the majority of the header image), or iPhones or iPads without a camera notch or "Dynamic Island".

![iPhone Dynamic Island](https://raw.githubusercontent.com/TestCentricity/tc_mobile_react_native_demo/main/.github/images/iPhone_Dynamic_Island.jpg)



## Instructions for running tests

In order for Cucumber to execute features or scenarios from the `tc_mobile_react_native_demo` test automation project, the
`test_context` must be specified in the Cucumber command line at runtime. There are 4 test execution profiles, or `test_context`,
that are supported (they are defined in `cucumber.yml`):
  * `bat_ios`  - Run Build Acceptance Test (BAT) suite on iPhone
  * `bat_android`  - Run Build Acceptance Test (BAT) suite on Android Phone
  * `regress_ios`  - Run full regression test suite on iPhone
  * `regress_android`  - Run full regression test suite on Android Phone

1. To run the Cucumber BAT suite on an iPhone simulator, execute the following command in the Terminal:

        bundle exec cucumber -p bat_ios

   ℹ️ **NOTE:**
    * To have Cucumber generate HTML formatted test results, append `-p report` to the above command line arguments.

   For example, to execute the BAT suite on an iPhone with test results being logged to an HTML test results file, execute
   the following command in the Terminal:

        bundle exec cucumber -p bat_ios -p report

   To execute the regression test suite on an Android phone, execute the following command in the Terminal:

        bundle exec cucumber -p regress_android

   ℹ️ **NOTE:**
    * Appium will automatically be started prior to tests being run on locally hosted simulators.

2. As the Cucumber tests are executing, the Terminal will display the lines of each feature file and scenario as they run
   in real-time.

3. Upon completion of test execution, the Terminal will display the final test results.

4. If you specified in the command line that HTML formatted test results should be generated (`-p report`), you can view
   them by opening the `reports` folder in the `tc_mobile_react_native_demo` project directory, and selecting the `test_results.html`
   file. Right-clicking on the `test_results.html` file will display a popup menu. Select the **Open in Browser** menu
   item, and then select a web browser from the popup sub menu that appears. The formatted test results will open in the
   web browser that you selected.


## Detailed Documentation

Detailed HTML documentation of the features, scenarios, and step definitions for the `tc_mobile_react_native_demo`project
can be accessed from the `index.html` file within the `doc` folder in the `tc_mobile_react_native_demo` project folder:

    📁 tc_mobile_react_native_demo
     ├── 📁 config
     ├── 📁 doc
     │   └── 📄 index.html
     ├── 📁 features
     └── 📁 reports

To view this documentation, navigate to the `index.html` file, right click on it, and select *Open in Browser*
