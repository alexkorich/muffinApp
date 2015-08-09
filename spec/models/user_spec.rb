require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { FactoryGirl.create :user }


 it 'invalid without name' do 
    expect(FactoryGirl.build :user, name: nil).not_to be_valid
  end

  it 'must have uniq name' do 
    FactoryGirl.create :user, name: "frank"
    user2=FactoryGirl.build :user, name: "frank"
   expect(user2).not_to be_valid
  end


  it 'invalid without email' do 
    expect(FactoryGirl.build :user, email: nil).not_to be_valid
  end

  it 'invalid without password' do
    expect(FactoryGirl.build :user, password: nil).not_to be_valid
  end
 xit 'must have >8 chars password' do
    expect(FactoryGirl.build :user, password: "111111", password_confirmation: "111111").not_to be_valid
  end


 xit "'s password must equal password confirmation" do
    expect(FactoryGirl.build :user,  password_confirmation: "111").not_to be_valid
  end

 it 'has many orders' do
   expect(user).to respond_to :orders
 end

  it 'becomes admin if first' do
   expect(user.role).to eq "admin"
  end

it 'becomes customer if second' do
  FactoryGirl.create :user
  user2=FactoryGirl.create :user
   expect(user2.role).to eq "customer"
  end
end
