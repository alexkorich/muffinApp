require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
before do
    @request.env['HTTP_REFERER'] = '/'
    request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    @order = FactoryGirl.create(:order, user: @user)
    
    @order_attributes = FactoryGirl.attributes_for(:order)
     
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @controller.stub(:current_ability).and_return(@ability)
    @ability.can :manage, :all
    sign_in(@user)
    
  end

  describe "GET #index" do
    it "gets all orders of specific user" do
      get :index
      expect(assigns(:orders)).to eq([@order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      get :show, {:id => @order.id}
      expect(assigns(:order)).to eq(@order)
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Order" do
        expect {
          post :create, {:order => @order_attributes}
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => @order_attributes}
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, {:order =>@order_attributes}
        expect(response).to redirect_to(Order.last)
      end
    end
    context "with unvalid params" do
      it "re-renders the 'new' template" do
        post :create, {:order => "invalid_attributes"}
        expect(response).to redirect_to("back")
      end
   end
  end

  
end
