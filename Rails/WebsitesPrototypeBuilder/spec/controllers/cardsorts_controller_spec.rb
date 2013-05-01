require 'spec_helper'

describe CardsortsController do
	before(:each) do
		get :new
	end

	it "shoud create a new cardsort" do
		nCardsorts_before = Cardsort.all.count
		get :new
		nCardsorts_after = Cardsort.all.count
		nCardsorts_after.should be > nCardsorts_before
	end

	it "@cards should not be nill" do
		get :new
		assigns(:cards).should_not be_nil
	end

	it "@groups should not be nill" do
		get :new
		assigns(:groups).should_not be_nil
	end


end

describe CardsortsController do
	before(:each) do
		@cardsort = Cardsort.new
		@cardsort.title = "cardsort"
		@cardsort.save
		get :edit, {:cardsort_id => 1}
	end

	it "@cards should not be nill" do
		assigns(:cards).should_not be_nil
	end

	it "@groups should not be nill" do
		assigns(:groups).should_not be_nil
	end
end

describe CardsortsController do
	before() do
		get :new
	end

	it "create new card" do
		get :create_card
		assigns(:card).should_not be_nil
	end

	it "create new group" do
		get :create_group
		assigns(:group).should_not be_nil
	end
end