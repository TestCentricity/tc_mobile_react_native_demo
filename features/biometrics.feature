@mobile @ios @!android @!device @regression @biometrics


Feature:  Biometric Authorization
  In order to ensure the security of critical business and customer data
  As a developer of the TestCentricity Mobile gem
  I expect to users to access the app only with valid biometric credentials


  Background:
    Given I have launched the SauceLabs My Demo app
    And I am not logged in


  Scenario:  Biometric authorization denied if not enabled at the system level
    When I have disabled biometrics for my device
    Then I should not be able to enable login via biometric authorization

@bat
  Scenario:  Biometric authorization denied if user submits non-matching biometric credentials
    Given I have enabled biometric authorization on the Biometrics screen
    When I tap the Login navigation menu item
    Then I should see a request to authorize using biometrics
    When I submit an invalid face ID
    Then biometric authorization should be denied

@bat
  Scenario:  Biometric authorization accepted if user submits matching biometric credentials
    Given I have enabled biometric authorization on the Biometrics screen
    When I tap the Login navigation menu item
    Then I should see a request to authorize using biometrics
    When I submit a valid face ID
    Then I should be logged in
