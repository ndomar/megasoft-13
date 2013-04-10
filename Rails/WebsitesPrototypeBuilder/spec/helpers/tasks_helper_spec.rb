require "spec_helper"

describe TasksHelper do 
  
  describe "#compareGender" do
    it "returns url of chart" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(FactoryGirl.attributes_for(:reviewer_info))
      expect(helper.compareGender(task)).to include("http")
    end
    it "returns a notice if there are no reviewers" do
      task = FactoryGirl.create(:task)
      expect(helper.compareGender(task)).to_not include("http")
    end
  end
  describe "#compareAge" do
    it "returns url of chart" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(FactoryGirl.attributes_for(:reviewer_info))
      expect(helper.compareAge(task)).to include("http")
    end
    it "returns a notice if there are no reviewers" do
      task = FactoryGirl.create(:task)
      expect(helper.compareAge(task)).to_not include("http")
    end
  end
  describe "#compareCountry" do
    it "returns url of chart" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(FactoryGirl.attributes_for(:reviewer_info))
      expect(helper.compareCountry(task)).to include("http")
    end
    it "returns a notice if there are no reviewers" do
      task = FactoryGirl.create(:task)
      expect(helper.compareCountry(task)).to_not include("http")
    end
  end
  describe "#avgtime" do
    it "returns url of chart" do
      task = FactoryGirl.create(:task)
      task.task_results.create(FactoryGirl.attributes_for(:task_result))
      expect(helper.avgtime(task)).to include("http")
    end
    it "returns a notice if there are no reviewers" do
      task = FactoryGirl.create(:task)
      expect(helper.avgtime(task)).to_not include("http")
    end
  end
end