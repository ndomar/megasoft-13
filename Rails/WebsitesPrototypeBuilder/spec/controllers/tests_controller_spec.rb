require 'spec_helper'

describe TestsController do

  describe "GET 'test_scan'" do
    it "returns http success" do
      get 'test_scan'
      response.should be_success
    end
  end

end
