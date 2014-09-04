require 'spec_helper'

feature "Create contact for agents" do
  before do
    agent = FactoryGirl.create(:agent, name: "Example")

    visit '/'
    click_link agent.name
    click_link "Add new contact"
  end

  scenario "create new contact for one agent" do
    fill_in "Name", with: "Example contact"
    fill_in "Tel", with: "02-12345678"
    fill_in "Address", with: "No.5, Haha road, Taipei city"

    click_button "Create Contact"
    expect(page).to have_content("Contact has been created.")
  end
end
