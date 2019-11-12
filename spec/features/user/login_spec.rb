require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user navigates to the login page and succesfully logs in', js: true do
    user
    visit root_path
    find('.nav-link', text: 'Login').click
    # expect { execute_payment! }.to raise_error(ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}")
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully.'
  end

end