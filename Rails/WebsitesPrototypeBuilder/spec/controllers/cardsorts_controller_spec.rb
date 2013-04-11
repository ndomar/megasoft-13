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

end

describe CardsortsController do
	before(:each) do
		get :edit, {:cardsort_id => 1}
	end

	it "@cards should not be nill" do
		assigns(:cards).should_not be_nil
	end

end

describe CardsortsController do
	before() do
		get :new
	end

	it "create new card" do
		get :create
		assigns(:card).should_not be_nil
	end
end