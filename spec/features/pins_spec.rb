require 'rails_helper'

describe 'accessing /pins as an unauthenticated user' do
	it 'asks me to sign in or sign up' do
	  visit '/pins'
	  expect(page).to have_content("sign in or sign up")
    end
end

describe 'accessing /pins/1 as an unauthenticated user' do
  before { Pin.create(description: "a"*21) }
  it 'does not ask me to sign in or sign up' do
    visit '/pins/1'
    expect(page).not_to have_content("sign in or sign up")
  end
end