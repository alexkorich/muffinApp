require "features/features_test_helper"

feature "User sees weekdays and menu" do
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
  let (:menu) {
    FactoryGirl.create :menu
  }




  context "if menu not created" do
    before(:each) do
      login
    end
    scenario "links" do
      expect(page).to have_content Date.today
      expect(page).to have_content "MonTueWedThuFriSatSun"
      expect(page).to have_link "menu"
      
    end
    scenario "no menu message" do
      expect(page).to have_content "Yay! No menu for today yet!"
       
        end
    end
    # context "menu created" do
    #  before(:each) do
    #     login
    #     menu
    #   end
    #   scenario "links" do
    #     menu
    #     expect(page).to have_content Date.today
    #     expect(page).to have_content "MonTueWedThuFriSatSun"
    #     expect(page).to have_link "menu"
        
    #   end

    #   scenario "message" do
    #     expect(page).to have_content "Menu for today:"
    #   end
    #    scenario "First course" do
    #     expect(page).to have_content "First course dishes"
    #     expect(page).to have_input "menu_first_course_dish_ids_1"
    #   end

      
    #    scenario "First course" do
    #     expect(page).to have_content "First course dishes"
    #   end


    #   scenario "submit" do
    #     expect(page).to have_button "Process order"
    #   end




    end
end
