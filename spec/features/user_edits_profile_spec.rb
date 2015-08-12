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
  context "valid" do
    scenario ": username" do
         login
          click_link 'Edit profile'
          fill_in 'user_name', with: "Dave"
          fill_in 'user_current_password', with: "password"
          click_button "Update"
          expect{user.name to eq "Dave"}
        end
    scenario ": email" do
         login
          click_link 'Edit profile'
          fill_in 'user_email', with: "new@email.com"
          fill_in 'user_current_password', with: "password"
          click_button "Update"
          expect{user.email to eq "new@email.com"}
        end     

      scenario ": password" do
         login
          click_link 'Edit profile'
          fill_in 'user_password', with: "22222222"
          fill_in 'user_password_confirmation', with: "22222222"
          fill_in 'user_current_password', with: "password"
          click_button "Update"
          expect{user.password to eq "22222222"}
        end      

    end

  context "unvalid" do

    scenario ": username" do
         login
          click_link 'Edit profile'
          fill_in 'user_name', with: ""
          fill_in 'user_current_password', with: "password"
          click_button "Update"
          expect(page).to have_content "can't be blank"
        end


    scenario ": email" do
         login
          click_link 'Edit profile'
          fill_in 'user_email', with: "11"
          fill_in 'user_current_password', with: "password"
          click_button "Update"
         expect(page).to have_content "is invalid"
        end     

      scenario ": password" do
         login
          click_link 'Edit profile'
          fill_in 'user_password', with: "22222222"
          fill_in 'user_password_confirmation', with: "22222222"
          fill_in 'user_current_password', with: "1111111"
          click_button "Update"
          expect(page).to have_content "is invalid"
        end      



  end


end
