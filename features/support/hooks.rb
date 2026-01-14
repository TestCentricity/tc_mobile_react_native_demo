BeforeAll do
  $feature = nil
  # create Cucumber reports folder if it doesn't already exist
  if ENV['REPORTING']
    reports_path = "#{Dir.pwd}/reports"
    Dir.mkdir(reports_path) unless Dir.exist?(reports_path)
  end
  # start Appium Server if command line option was specified
  if ENV['APPIUM_SERVER'] == 'run'
    $server = AppiumServer.new
    $server.start
  end
end


AfterAll do
  # close Appium driver
  AppiumConnect.quit_driver
  # terminate Appium Server if command line option was specified and Appium server is running
  if ENV['APPIUM_SERVER'] == 'run' && Environ.driver == :appium && $server.running?
    $server.stop
  end
end


Before do |scenario|
  # if executing tests in parallel concurrent threads, print thread number with scenario name
  message = Environ.parallel ? "Thread ##{Environ.process_num} | Scenario:  #{scenario.name}" : "Scenario:  #{scenario.name}"
  log message
  $initialized ||= false
  unless $initialized
    $initialized = true
    # connect to Appium driver and install app
    caps = if ENV['W3C_CAPS']
             capabilities.find_capabilities(ENV['W3C_CAPS'])
             Capabilities.current.caps
           else
             nil
           end
    AppiumConnect.initialize_appium(caps)
    # HTML report header information if reporting is enabled
    log Environ.report_header if ENV['REPORTING']
  end
  # reset signed in and portal status when starting tests on a different cuke feature file
  current_feature_file = scenario.location.to_s.split(':')[0]
  if $feature != current_feature_file
    $feature = current_feature_file
    Environ.set_signed_in(false)
    Environ.portal_state = :quit
  end
end


After do |scenario|
  # disable biometric authorization
  AppiumConnect.set_biometric_enrollment(false) if Environ.is_ios? && Environ.is_simulator?
  # save the feature file location for tracking when all scenarios have been executed in a feature file
  $feature = scenario.location.to_s.split(':')[0]
  # process and embed any screenshots recorded during execution of scenario
  process_embed_screenshots(scenario)
  # clear out any queued screenshots
  Environ.reset_contexts
  # close app
  AppiumConnect.terminate_app
end


# exclusionary Around hooks to prevent running feature/scenario on unsupported browsers, devices, or
# cloud remote browser hosting platforms. Use the following tags to block test execution:
#   mobile devices:            @!ipad, @!iphone


# block feature/scenario execution if running against iPad mobile browser
Around('@!ipad') do |scenario, block|
  qualify_device('ipad', scenario, block)
end


# block feature/scenario execution if running against iPhone mobile browser
Around('@!iphone') do |scenario, block|
  qualify_device('iphone', scenario, block)
end


# block feature/scenario execution if running against a physical mobile device
Around('@!device') do |scenario, block|
  if Environ.is_device?
    log "Scenario '#{scenario.name}' cannot be executed on physical devices."
    skip_this_scenario
  else
    block.call
  end
end


# block feature/scenario execution if running against an emulated mobile device
Around('@!simulator') do |scenario, block|
  if Environ.is_simulator?
    log "Scenario '#{scenario.name}' cannot be executed on emulated devices."
    skip_this_scenario
  else
    block.call
  end
end


Around('@!ios') do |scenario, block|
  if Environ.is_ios? || ENV['PLATFORM'] == 'ios'
    log "Scenario '#{scenario.name}' can not be executed on iOS devices."
    skip_this_scenario
  else
    block.call
  end
end


Around('@!android') do |scenario, block|
  if Environ.is_android? || ENV['PLATFORM'] == 'android'
    log "Scenario '#{scenario.name}' can not be executed on Android devices."
    skip_this_scenario
  else
    block.call
  end
end


# supporting methods

def qualify_device(device, scenario, block)
  if Environ.is_device?
    if Environ.device_type.include? device
      log "Scenario '#{scenario.name}' cannot be executed on #{device} devices."
      skip_this_scenario
    else
      block.call
    end
  else
    block.call
  end
end

def screen_shot_and_save_page(scenario)
  filename = "Screenshot-#{Time.now.strftime('%Y%m%d%H%M%S%L')}.png"
  path = File.join Dir.pwd, 'reports/screenshots/', filename
  AppiumConnect.take_screenshot(path)
  log "Screenshot saved at #{path}"
  screen_shot = { path: path, filename: filename }
  Environ.save_screen_shot(screen_shot)
  attach(path, 'image/png') unless scenario.nil?
end

def process_embed_screenshots(scenario)
  screen_shots = Environ.get_screen_shots
  if screen_shots.count > 0
    screen_shots.each do |row|
      path = row[:path]
      attach(path, 'image/png')
    end
  else
    screen_shot_and_save_page(scenario) if scenario.failed?
  end
end
