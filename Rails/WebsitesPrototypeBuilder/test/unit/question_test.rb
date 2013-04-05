require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "should not save question without body and assigned_part" do
	  question = Question.new
	  assert !question.save, "Saved the question without a body"
	end

end
