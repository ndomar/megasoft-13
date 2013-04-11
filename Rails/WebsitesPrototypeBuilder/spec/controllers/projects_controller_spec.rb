describe ProjectsController	do	
	it "Hossam1" do
		get :save {:id => 1,:html => "asdasdas"}
		assigns(:page).should_not be_nil
	end
end

