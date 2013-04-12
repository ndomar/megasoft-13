require 'spec_helper.rb'

describe Qquestion do

  before(:each) do
    @attr = {:body =>"My Question?",:qtype => 1,:choices_attributes=> [{:body =>"My choice"}]}
  end

  it "should create a new question" do
    Qquestion.create!(@attr)
  end

  it "should require a body" do
    no_body = Qquestion.new(@attr.merge(:body => ""))
    no_body.should_not be_valid
  end

  it "should require at least one choice if type3" do
    no_choice = Qquestion.new(@attr.merge(:choices_attributes => [{}],:qtype => 3))
    no_choice.should_not be_valid
  end

  it "should require at least two choice if type4" do
    no_choice = Qquestion.new(@attr.merge(:choices_attributes => [{}],:qtype => 4))
    no_choice.should_not be_valid
    ono_choice = Qquestion.new(@attr.merge(:choices_attributes => [{},{:body =>"My choice"}],:qtype => 4))
    ono_choice.should_not be_valid
  end

end