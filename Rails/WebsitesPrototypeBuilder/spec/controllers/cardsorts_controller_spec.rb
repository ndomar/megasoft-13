require 'spec_helper'

describe CardsortsController do
	describe 'create' do
		it "shoud create a new cardsort" do
			nCardsorts_before = Cardsort.all.count
			post :create_cardsort, {:cardsort => {:title => "cardsort1"}}
			nCardsorts_after = Cardsort.all.count
			nCardsorts_after.should be > nCardsorts_before
		end

		it "@cards should not be nill" do
			post :create_cardsort, {:cardsort => {:title => "cardsort1"}}
			get :show, {:cardsort_id => 1}
			assigns(:cards).should_not be_nil
		end

		it "@groups should not be nill" do
			post :create_cardsort, {:cardsort => {:title => "cardsort1"}}
			get :show, {:cardsort_id => 1}
			assigns(:groups).should_not be_nil
		end
	end
end

describe CardsortsController do
	before() do
		get :create_cardsort, {:cardsort => {:title => "cardsort1"}}
	end

	it "create new card" do
		post :create_card
		assigns(:card).should_not be_nil
	end

	it "should not be valid" do
		post :create_card
		assigns(:card).should_not be_valid
	end

	it "should not be valid" do
		post :create_card, {:title => 'card1'}
		assigns(:card).should be_valid
	end

	it "create new group" do
		post :create_group
		assigns(:group).should_not be_nil
	end

	it "create new group" do
		post :create_group
		assigns(:group).should_not be_valid
	end

	it "create new group" do
		post :create_group, {:title => 'group1'}
		assigns(:group).should be_valid
	end

end