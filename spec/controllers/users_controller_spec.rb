require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template('new')
    end
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     post :create
  #     expect(response).to render_template('create')
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #show" do
    it "returns http success" do
      user = User.new(user_name: 'asem', password: '123456')
      user.save!
      get :show, params: {id: user.id}
      #response.should render_template :show
      expect(response).to render_template('show')
      expect(response).to have_http_status(:success)
      expect(response).to render_template('show')
    end
  end

  context 'create with invalid params' do
    it 'validates the presence of user_name and password' do
      post :create, params: { user: { user_name: 'asem' , password: '' } }
      expect(response).to render_template('new')
      expect(flash[:errors]).to be_present
  end

  context 'with valid params' do
    it 'redirects to the link show page' do
      post :create, params: { user: { user_name: 'asem' , password: '123456' } }
      user = User.find_by(user_name: 'asem')
      # expect(response).to redirect_to(user_path)
      #response.should redirect_to user_path(user)
      expect(response).to redirect_to(user_path(user))
      #response.should redirect_to users_path
    end
  end
end


end
