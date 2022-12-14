require 'rails_helper'

RSpec.describe Project, type: :feature do
  before(:each) do
    @user = create(:user)
  end

  it "can create a new project and append to list" do
    login_as(@user, scope: :user)
    visit projects_path

    click_on "New Project"
    fill_in "project[name]", with: "My First Project"
    fill_in "project[description]", with: "Dummy project details"
    
    click_on "Save Project"

    expect(page).to have_content("My First Project")
  end
end