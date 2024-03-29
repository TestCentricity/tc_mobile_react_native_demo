module SharedDrawingScreen
  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: 'Drawing'
      },
      clear_button => {
        visible: true,
        enabled: true,
        caption: 'Clear'
      },
      save_button => {
        visible: true,
        enabled: true,
        caption: 'Save'
      },
      drawing_pad => {
        visible: Environ.is_android?,
        enabled: true
      }
    }
    verify_ui_states(ui)
  end

  def draw_shape(style)
    drawing_pad.wait_until_exists(5)
    obj = drawing_pad.element
    case style.downcase.to_sym
    when :square
      driver.action
            .click_and_hold(obj)
            .move_to(obj, -100, -150, duration: 1)
            .move_to(obj, 100, -150, duration: 1)
            .move_to(obj, 100, 100, duration: 1)
            .move_to(obj, -100, 100, duration: 1)
            .move_to(obj, -100, -150, duration: 1)
            .move_to(obj, 0, -150, duration: 1)
            .perform

    when :triangle
      driver.action
            .click_and_hold(obj)
            .move_to(obj, 0, -150, duration: 1)
            .move_to(obj, 100, 150, duration: 1)
            .move_to(obj, -100, 150, duration: 1)
            .move_to(obj, 0, -150, duration: 1)
            .perform
    else
      raise "#{style} is not a valid selector"
    end
    sleep(2)
  end

  def perform_action(action)
    case action.downcase.to_sym
    when :clear
      clear_button.click
    when :save
      save_button.click
    else
      raise "#{action} is not a valid selector"
    end
  end

  def verify_drawing_saved
    modal_action(:accept)
  end

  def verify_no_save
    perform_action('save')
    if alert_modal.await(2)
      raise 'Cleared drawing pad should not be saved'
    else
      puts 'Cleared drawing pad was not saved'
    end
  end
end
