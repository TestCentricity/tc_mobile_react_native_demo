

When(/^I am not logged in$/) do
  logout
end


When(/^I have (.*) biometrics for my device$/) do |action|
  state = case action.downcase.to_sym
          when :enabled
            true
          when :disabled
            false
          else
            raise "#{action} is not a valid selector"
          end
  AppiumConnect.set_biometric_enrollment(state)
end


Then(/^I should( not)? be able to enable login via biometric authorization$/) do |negate|
  biometric_state = !negate
  assert_equal(biometric_state, AppiumConnect.is_biometric_enrolled?, "Expected biometric enrollment to be #{biometric_state}")
  load_biometrics_screen
  biometrics_screen.verify_biometric_capable(state = biometric_state)
end


When(/^I have (.*) biometric authorization on the Biometrics screen$/) do |action|
  AppiumConnect.set_biometric_enrollment(true)
  state = case action.downcase.to_sym
          when :enabled
            :on
          when :disabled
            :off
          else
            raise "#{action} is not a valid selector"
          end
  load_biometrics_screen
  biometrics_screen.biometric_auth(state)
end


Then(/^I should see a request to authorize using biometrics$/) do
  ScreenManager.current_screen.verify_face_id_request
end


When(/^I submit an? (.*) face ID$/) do |state|
  match = case state.downcase.to_sym
          when :valid
            true
          when :invalid
            false
          else
            raise "#{action} is not a valid selector"
          end
  AppiumConnect.biometric_match(:faceId, match)
end


Then(/^biometric authorization should be denied$/) do
  ScreenManager.current_screen.verify_face_id_unrecognized
end


Then(/^I should( not)? be logged in$/) do |negate|
  if negate
    login_screen.verify_screen_exists
  else
    products_screen.verify_screen_exists
  end
end


def load_biometrics_screen
  biometrics_screen.navigate_to
  biometrics_screen.modal_action(:accept)
  biometrics_screen.verify_screen_exists
end
