require 'rails_helper'
RSpec.describe ReviewsController, type: :controller do
  let(:valid_attributes) {
    { content: 'Great place!', rating: 5 }
  }
  let(:invalid_attributes) {
    { content: '', rating: 6 }
  }
  let(:restaurant) { Restaurant.create!(name: 'Test Restaurant', address: '123 Main St', category: 'italian') }
  describe "GET #new" do
    it "routes to #new" do
      get :new, params: { restaurant_id: restaurant.id }
      expect(response).to be_successful
    end
    it "assigns a new review as @review" do
      get :new, params: { restaurant_id: restaurant.id }
      expect(assigns(:review)).to be_a_new(Review)
    end
  end
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, params: { restaurant_id: restaurant.id, review: valid_attributes }
        }.to change(Review, :count).by(1)
      end
      it "assigns a newly created review as @review" do
        post :create, params: { restaurant_id: restaurant.id, review: valid_attributes }
        expect(assigns(:review)).to be_a(Review)
        expect(assigns(:review)).to be_persisted
      end
      it "redirects to the parent restaurant" do
        post :create, params: { restaurant_id: restaurant.id, review: valid_attributes }
        expect(response).to redirect_to(restaurant)
      end
    end
    context "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        post :create, params: { restaurant_id: restaurant.id, review: invalid_attributes }
        expect(assigns(:review)).to be_a_new(Review)
      end
      it "re-renders the 'new' template" do
        post :create, params: { restaurant_id: restaurant.id, review: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end
end
