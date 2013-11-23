module AuthenticationHelpers
  def sign_up
    visit root_path
    find(:css, "#new_user input[id='user_email']").set "person@example.com"
    find(:css, "#new_user input[id='user_password']").set "password"
    click_button "Sign up"
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers
end
