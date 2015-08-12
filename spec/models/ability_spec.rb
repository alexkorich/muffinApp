require 'cancan/matchers'
require 'rails_helper'
 
RSpec.describe Ability, type: :model do

  describe "abilities of loggined user" do
    subject { ability }
    let!(:admin){ FactoryGirl.create(:user)}
    let!(:user){ FactoryGirl.create(:user, role:"customer") } 

    let!(:ability){ Ability.new(user) }
    let(:menu){ FactoryGirl.create(:menu) }
    let(:order){ FactoryGirl.create(:order, user:user) }
    let(:other_order){ FactoryGirl.create(:order) }

    context 'for orders' do 
      it { expect(subject).to be_able_to(:create, order) }
      it { expect(subject).to be_able_to(:read, order) }
      it { expect(subject).to be_able_to(:create_from_menu, order) }

      it { expect(subject).not_to be_able_to(:read, other_order) }
      it { expect(subject).not_to be_able_to(:update, other_order) }
      it { expect(subject).not_to be_able_to(:destroy, other_order) }
    end

    context 'for menus' do 
      it { expect(subject).to be_able_to(:read, menu) }
      it { expect(subject).to be_able_to(:find_by_date, menu) }
      
      it { expect(subject).not_to be_able_to(:delete, menu) }
      it { expect(subject).not_to be_able_to(:update, menu) }
      
    end

    context 'not able' do 
      it { expect(subject).not_to be_able_to(:access, :rails_admin) }
      it { expect(subject).not_to be_able_to(:dashboard, :t) }
      it { expect(subject).not_to be_able_to(:manage, :all) }
    end
  end


  
  describe "abilities of admin" do
    
    let!(:ability){ Ability.new(admin) }
    let!(:admin){ FactoryGirl.create(:user)}
    let(:dish){ FactoryGirl.create(:dish) }
    let(:menu){ FactoryGirl.create(:menu) }
    let(:yesterday_menu){ FactoryGirl.create(:menu, date:Date.yesterday) }
    let(:menu){ FactoryGirl.create(:menu) }
    let(:order){ FactoryGirl.create(:order) }
    let (:user){ FactoryGirl.create(:user)}

    context 'for posts' do
      it { expect(ability).to be_able_to(:read, dish) }
      it { expect(ability).to be_able_to(:create, dish) }
      it { expect(ability).to be_able_to(:update, dish) }
      it { expect(ability).to be_able_to(:destroy, dish) }
     end

     context 'for menu' do
      it { expect(ability).to be_able_to(:read, menu) }
      it { expect(ability).to be_able_to(:create, menu) }
      it { expect(ability).to be_able_to(:update, menu) }
      it { expect(ability).to be_able_to(:delete, menu) }
      # it { expect(ability).not_to be_able_to(:create, yesterday_menu) }
     end
     context 'for user' do
      it { expect(ability).to be_able_to(:read, user) }
      it { expect(ability).to be_able_to(:create, user) }
      it { expect(ability).to be_able_to(:update, user) }
      it { expect(ability).to be_able_to(:delete, user) }
     end
     context 'for everything' do
      it { expect(ability).to be_able_to(:access, :rails_admin) }
      it { expect(ability).to be_able_to(:dashboard, :t) }
      it { expect(ability).to be_able_to(:manage, :all) }
     end


   end

end