module SharedLoginScreen
  def verify_screen_ui
    super
    ui = {
      header_label => {
        visible: true,
        caption: 'Login'
      },
      username_label => {
        visible: true,
        caption: 'Username'
      },
      username => {
        visible: true,
        enabled: true
      },
      password_label => {
        visible: true,
        caption: 'Password'
      },
      password => {
        visible: true,
        enabled: true
      },
      login_button => {
        visible: true,
        enabled: true,
        caption: 'Login'
      }
    }
    verify_ui_states(ui)
  end

  def login
    fields = {
      username => UserData.current.username,
      password => UserData.current.password
    }
    populate_data_fields(fields)
    login_button.tap
  end

  def verify_entry_error(reason)
    ui = case reason.gsub(/\s+/, '_').downcase.to_sym
         when :invalid_password, :invalid_user
           {
             generic_error => {
               visible: true,
               caption: 'Provided credentials do not match any user in this service.'
             }
           }
         when :locked_account
           {
             generic_error => {
               visible: true,
               caption: 'Sorry, this user has been locked out.'
             }
           }
         when :no_username
           {
             username_error => {
               visible: true,
               caption: 'Username is required'
             }
           }
         when :no_password
           {
             password_error => {
               visible: true,
               caption: 'Password is required'
             }
           }
         else
           raise "#{reason} is not a valid selector"
         end
    verify_ui_states(ui)
  end
end
