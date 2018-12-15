require 'rails_helper'

describe UsersController, type: :controller do
  #let(:user) {User.create!(email:"oana.mirona@yahoo.ro", password:"password", password_confirmation: "password" )}
  #@user = FactoryBot.build(:user)
  #let(:user_second) {User.create!(email:"test@test.com", password:"password", password_confirmation: "password" )}

  before do
    @user = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
  end

  describe 'GET #show' do
    context "when a user is logged in" do
      
      before do
        sign_in @user
      end

      it "loads correct user details" do
        get :show, params: {id: @user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user
      end

      it "cannot access the other user's details" do
        get :show, params: {id: @user2.id} 
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "when a user is not logged in" do
      it "redirects to login" do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end