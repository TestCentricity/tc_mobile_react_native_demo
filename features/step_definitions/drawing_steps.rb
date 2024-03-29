

When(/^I draw a (.*) on the drawing pad$/) do |shape|
  drawing_screen.draw_shape(shape)
end


When(/^I choose to (.*) the drawing$/) do |action|
  drawing_screen.perform_action(action)
end


Then(/^I should not be able to save the drawing$/) do
  drawing_screen.verify_no_save
end


Then(/^I expect the drawing to be saved$/) do
  drawing_screen.verify_drawing_saved
end
