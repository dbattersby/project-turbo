require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = create(:user)
  end

  it "allows user to sign in and redirect to homepage" do
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on "Sign in"

    expect(page).to have_content("Pages#home")
  end
end