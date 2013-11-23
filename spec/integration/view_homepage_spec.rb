require 'spec_helper'

feature 'view the homepage' do 
  scenario 'user sees relevant information' do
    visit root_path
    expect(page).to have_css 'title', text: "TrackAnything", visible: false
    expect(page).to have_css 'h2', text: "Always Be Improving"
    expect(page).to have_css 'h2', text: "Get Started For Free"
  end
end
