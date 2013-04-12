<<<<<<< HEAD
require 'spec_helper.rb'

describe Choice do

  before(:each) do
    @attr = {:body =>"My choice"}
  end

  it "should create a new Choice" do
    Choice.create!(@attr)
  end

  it "should require a body" do
    no_body = Choice.new(@attr.merge(:body => ""))
    no_body.should_not be_valid
  end

=======
require 'spec_helper.rb'

describe Choice do

  before(:each) do
    @attr = {:body =>"My choice"}
  end

  it "should create a new Choice" do
    Choice.create!(@attr)
  end

  it "should require a body" do
    no_body = Choice.new(@attr.merge(:body => ""))
    no_body.should_not be_valid
  end

>>>>>>> master
end