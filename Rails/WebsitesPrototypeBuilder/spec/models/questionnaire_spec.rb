require 'spec_helper.rb'

describe Questionnaire do

  before(:each) do
    @attr = {:title=> "test questionnaire",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}]}
  end

  it "should create a new questionnaire" do
    Questionnaire.create!(@attr)
  end

   it "should require a title" do
    no_title = Questionnaire.new(@attr.merge(:title => ""))
    no_title.should_not be_valid
  end

  it "should require at least one question" do
    no_question = Questionnaire.new(@attr.merge(:qquestions_attributes => [{}]))
    no_question.should_not be_valid
  end

	let(:questionnaire) { FactoryGirl.build(:questionnaire) }    

	it "Has a unique title if same project" do
	  older_questionnaire = FactoryGirl.create(:questionnaire)
	  questionnaire.title = older_questionnaire.title
	  questionnaire.project_id = older_questionnaire.project_id
	  questionnaire.should_not be_valid
	end

	it "Should have same title for different projects" do
	  older_questionnaire = Questionnaire.new(@attr.merge(:title => "title"))
	  questionnaire.title = 1
	  older_questionnaire.project_id = 2
	  questionnaire.title = older_questionnaire.title
	  questionnaire.should be_valid
	end

end