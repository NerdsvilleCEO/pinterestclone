require 'rails_helper'
describe "the signin process" do
  before :each do
    User.create(:email => "nerdsville@nerdsville.net", 
    		  :password => 'password')
  end

  it 'signs me in' do
  	visit '/users/sign_in'
  	within("#new_user") do
      fill_in 'Email', :with => 'nerdsville@nerdsville.net'
      fill_in 'Password', :with => 'password'
  	end
  	click_button 'Log In'
  	expect(page).to have_content('Sign Out')
  end

  it 'signs me out' do
  	visit '/users/sign_in'
  	within("#new_user") do
      fill_in 'Email', :with => 'nerdsville@nerdsville.net'
      fill_in 'Password', :with => 'password'
  	end
  	click_button 'Log In'
  	click_link('Sign Out')
  	expect(page).to have_content('Sign In')
  end
  
end