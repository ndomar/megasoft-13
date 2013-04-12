require 'spec_helper'

describe PagesController do

  before(:each) do
    @page = FactoryGirl.create(:page)
  end

  it "should delete a page" do
    delete :destroy, :id => @page.id
  end
end