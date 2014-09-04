require 'spec_helper'

feature "Set default contact for agents" do
  let!(:agent) { FactoryGirl.create(:agent, name: "test") }
  let!(:contact) { FactoryGirl.create(:contact, name: "haha", agent: agent) }
  before do
    #agent = FactoryGirl.create(:agent, name: "test")
    #contact = FactoryGirl.create(:contact, name: "haha", agent: agent)
  end

  #scenario "Set default contact for one agent", js: true do
  scenario "Set default contact for one agent" do
    skip "current webdriver gem hasn't suppoert FF v.32"
    visit '/'
    click_link "test"
    page.select("haha", { :from => "agent_default_contact"})

    expect(agent.default_contact.to_i).to eql(contact.id)
  end
end
