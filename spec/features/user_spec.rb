require "features/features_test_helper"



feature "Edit profile" do
let (:login) {
  FactoryGirl.create :user
  visit '/users/sign_in/'
  within '#user-nav' do
    click_link 'Sign up'
  end
  within("#new_user") do
    fill_in 'Name', with: "John"
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'Password confirmation', with: 'password'
  end
  click_button 'Sign up'
}


scenario "user enters edit page" do
     login
      
      expect(page).to have_link 'Edit profile'
    end
end
