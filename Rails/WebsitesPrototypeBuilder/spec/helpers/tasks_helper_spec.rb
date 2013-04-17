#encoding : utf-8
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
      expect(helper.compareGender(task)).to include("لم يتم احد المهمة")
    end
    it "returns a notice if there are no reviewer_infos" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      expect(helper.compareGender(task)).to include("لا توجد معلومات")
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
      expect(helper.compareAge(task)).to include("لم يتم احد المهمة")
    end
    it "returns a notice if there are no reviewer_infos" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      expect(helper.compareAge(task)).to include("لا توجد معلومات")
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
      expect(helper.compareCountry(task)).to include("لم يتم احد المهمة")
    end
    it "returns a notice if there are no reviewer_infos" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      expect(helper.compareCountry(task)).to include("لا توجد معلومات")
    end  
  end
  describe "#calculateResultsSummary" do
    it "returns url of chart" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      task.task_results.create(FactoryGirl.attributes_for(:task_result))
      expect(helper.calculateResultsSummary([task])[0]).to include("http")
      expect(helper.calculateResultsSummary([task])[1]).to include("http")
    end
    it "returns a notice if there are no reviewers" do
      task = FactoryGirl.create(:task)
      expect(helper.calculateResultsSummary([task])).to include("لم يتم احد المهمة")
    end
    it "returns a notice if there are no task_results" do
      task = FactoryGirl.create(:task)
      reviewer = task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      expect(helper.calculateResultsSummary([task])).to include("لا توجد نتائج")
    end
  end
end