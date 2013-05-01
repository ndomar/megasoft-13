require 'spec_helper'

describe ProjectsController do 
	it "should create a new media record" do
		count_before = Media.all.count
		post "upload_media"
		count_after = Media.all.count
		count_before.should be < count_after
	end	
end