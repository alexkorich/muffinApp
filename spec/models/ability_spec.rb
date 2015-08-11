require 'cancan/matchers'
require 'spec_helper'
 
describe Ability do
  describe "abilities of loggined user" do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ FactoryGirl.create(:user) }
    let(:post){ FactoryGirl.create(:post, user: user) }
    let(:other_post){ FactoryGirl.create(:post) }
 
    context 'for posts' do
      it { expect(ability).to be_able_to(:read, post) }
      it { expect(ability).to be_able_to(:create, Post) }
      it { expect(ability).to be_able_to(:update, post) }
      it { expect(ability).to be_able_to(:destroy, post) }
 
      it { expect(ability).not_to be_able_to(:read, other_post) }
      it { expect(ability).not_to be_able_to(:update, other_post) }
      it { expect(ability).not_to be_able_to(:destroy, other_post) }
    end
  end
  describe "abilities of admin" do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ FactoryGirl.create(:user) }
    let(:post){ FactoryGirl.create(:post, user: user) }
    let(:other_post){ FactoryGirl.create(:post) }
 
    context 'for posts' do
      it { expect(ability).to be_able_to(:read, post) }
      it { expect(ability).to be_able_to(:create, Post) }
      it { expect(ability).to be_able_to(:update, post) }
      it { expect(ability).to be_able_to(:destroy, post) }
 
      it { expect(ability).not_to be_able_to(:read, other_post) }
      it { expect(ability).not_to be_able_to(:update, other_post) }
      it { expect(ability).not_to be_able_to(:destroy, other_post) }
    end
  end
end