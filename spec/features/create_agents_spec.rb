require 'spec_helper'

feature "Create agents" do
  before do
    visit '/'

    click_link "New agent"
  end

  scenario "create one agent" do
    fill_in "Name", with: "Example agent"

    click_button "Create Agent"
    expect(page).to have_content("Agent has been created.")
  end
end
