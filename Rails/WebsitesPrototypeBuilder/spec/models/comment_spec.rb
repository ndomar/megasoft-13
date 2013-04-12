require 'spec_helper.rb'

describe Comment do

  before(:each) do
    @attr = {:body =>"My Comment",:assigned_part => "1"}
  end

  it "should create a new Comment" do
    Comment.create!(@attr)
  end

  it "should require a Comment" do
    no_body = Comment.new(@attr.merge(:body => ""))
    no_body.should_not be_valid
  end

  it "should require an assigned_part" do
    no_body = Comment.new(@attr.merge(:assigned_part => ""))
    no_body.should_not be_valid
  end

  it "should have a maximum length of 8000" do
    chars = (0..9).to_a.concat(('a'..'z').to_a).concat(('A'..'Z').to_a).concat(['|',',','.','!','-'])
    str = ""; 8001.times {str += chars.sample.to_s}
    no_body = Comment.new(@attr.merge(:body => str))
    no_body.should_not be_valid
  end

=======
require 'spec_helper.rb'

describe Comment do

  before(:each) do
    @attr = {:body =>"My Comment",:assigned_part => "1"}
  end

  it "should create a new Comment" do
    Comment.create!(@attr)
  end

  it "should require a Comment" do
    no_body = Comment.new(@attr.merge(:body => ""))
    no_body.should_not be_valid
  end

  it "should require an assigned_part" do
    no_body = Comment.new(@attr.merge(:assigned_part => ""))
    no_body.should_not be_valid
  end

  it "should have a maximum length of 8000" do
    chars = (0..9).to_a.concat(('a'..'z').to_a).concat(('A'..'Z').to_a).concat(['|',',','.','!','-'])
    str = ""; 8001.times {str += chars.sample.to_s}
    no_body = Comment.new(@attr.merge(:body => str))
    no_body.should_not be_valid
  end

 
end