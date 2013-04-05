require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  @page = Page.new(:html => "<p>this is the answer</p>", :page_name => "test")
  @question = Question.new(:assigned_part => "1", :body => "this is a question", :page =>@page.id)

  test "insertion of a new answer" do
  	@answer = Answer.new(:answer => "this is the answer", :question => @question.id, :page =>@page.id)
  	assert @answer.valid?
  end

  test "inserting a new answer" do
	  @answer = Answer.new(:answer => "", :question =>@question.id , :page= @page.id)
	  refute @answer.valid?
	end
  end
end
