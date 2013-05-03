#encoding: utf-8
require "spec_helper"

describe StatisticsHelper do
  describe "calculate all or cetain tasks results summary" do
    before(:each) do
      @project = FactoryGirl.create(:project)
      @task = @project.tasks.create(FactoryGirl.attributes_for(:task))
      @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      @task.task_results.create(FactoryGirl.attributes_for(:task_result))
    end

    it "calculateAlltasksResultsSummary(tasks) returns an array of 3 arrays of integers
     if results and reviewers are available" do  
      resultssummary = helper.calculateAllTasksResultsSummary([@task])
      expect(resultssummary[0][0]).to be_kind_of(Float)
      expect(resultssummary[1][0]).to be_kind_of(Float)
      expect(resultssummary[2][0]).to be_kind_of(Integer)
    end

    it "calculateAlltasksResultsSummary(tasks) returns an array of 3 arrays of zeros 
    if there are no task_results or reviewers" do
      task = @project.tasks.create(FactoryGirl.attributes_for(:task))
      resultssummary = calculateAllTasksResultsSummary([task])
      expect(resultssummary[0][0]).to eq 0
      expect(resultssummary[1][0]).to eq 0
      expect(resultssummary[2][0]).to eq 0
    end

    it "calculateResultsSummary(tasks) returns the average accumulated success and time of each task 
    if there are task results and reviewers" do
      @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      @task.task_results.create(:success => false, :time => 6)
      resultssummary = helper.calculateResultsSummary([@task])
      expect(resultssummary[0][0].length).to eq(@task.reviewers.length + 1)
      expect(resultssummary[0][0][1]).to eq(3)
      expect(resultssummary[1][0].length).to eq(@task.reviewers.length + 1)
      expect(resultssummary[1][0][1]).to eq(1)
    end

    it "calculateResultsSummary(tasks) returns a notice if there are no reviewers" do
      task = @project.tasks.create(FactoryGirl.attributes_for(:task))
      notice = helper.calculateResultsSummary([task])
      expect(notice).to eq("لم يتم احد المهمة")
    end

    it "calculateResultsSummary(tasks) returns a notice if there are reviewers but no results" do
      task = @project.tasks.create(FactoryGirl.attributes_for(:task))
      task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      notice = helper.calculateResultsSummary([task])
      expect(notice).to eq("لا توجد نتائج")
    end
  end 

  describe "calculate statistics of reviewer information of certain task" do
    before(:each) do
      @project = FactoryGirl.create(:project)
      @task = @project.tasks.create(FactoryGirl.attributes_for(:task))
    end

    it "getReviewerInfos(task) returns a notice if there are no reviewers" do
      notice = helper.getReviewerInfos(@task)
      expect(notice).to eq("لم يتم احد المهمة")
    end

    it "getReviewerInfos(task) returns a notice if there is no reviewer info for any reviewer" do
      @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      arrayofnotices = helper.getReviewerInfos(@task)
      expect(arrayofnotices[0]).to eq("لم يستكمل أحد المراجعين استمارة المعلومات الشخصية")
      expect(arrayofnotices[1]).to eq("لم يستكمل أحد المراجعين استمارة المعلومات الشخصية")
      expect(arrayofnotices[2]).to eq("لم يستكمل أحد المراجعين استمارة المعلومات الشخصية")
    end

    it "getReviewerInfos(task) returns a notice if a age attribute has
    not been supplied by any reviewer" do
      reviewer = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(:gender => true, :country => "Egypt")
      reviewersinfos = helper.getReviewerInfos(@task)
      expect(reviewersinfos[0]).to eq("لم يجب أحد من المراجعين عن سنه")
    end

    it "getReviewerInfos(task) returns a notice if a country attribute has
    not been supplied by any reviewer" do
      reviewer = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(:gender => true, :age => 19)
      reviewersinfos = helper.getReviewerInfos(@task)
      expect(reviewersinfos[1]).to eq("لم يجب أحد من المراجعين عن بلده")
    end

    it "getReviewerInfos(task) returns a notice if a gender attribute has
    not been supplied by any reviewer" do
      reviewer = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer.create_reviewer_info(:age => 19, :country => "Egypt")
      reviewersinfos = helper.getReviewerInfos(@task)
      expect(reviewersinfos[2]).to eq("لم يجب أحد من المراجعين عن نوعه")
    end

    it "getReviewerInfos(task) returns an array of all attributes info if they are all supplied" do
      reviewer1 = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer1.create_reviewer_info(FactoryGirl.attributes_for(:reviewer_info))
      reviewer2 = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer2.create_reviewer_info(:age => 23, :gender => false, :country => "Egypt")
      reviewer3 = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer3.create_reviewer_info(:age => 49, :gender => false, :country => "Libya")
      reviewer4 = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
      reviewer4.create_reviewer_info(:age => 84, :gender => true, :country => "Libya")
      reviewersinfos = helper.getReviewerInfos(@task)
      expect(reviewersinfos).to eq([[['السن أقل من 20', 'السن أقل من 40', 'السن أقل من 60', 'السن أكثر من 60'], 
        [1,1,1,1]], [["Egypt", "Libya"], [2, 2]], [['ذكر', 'أنثى'], [2,2]]])
    end
  end

  it "getOccurrences(card, group) returns number of occurrences of card in group" do 
    project = FactoryGirl.create(:project)
    cardsort = project.cardsorts.create(:title => "A", :description => "DES", :open => false)
    group = cardsort.groups.create(:title => "A", :description=> "DES")
    card = cardsort.cards.create(:title => "A", :description => "DES")
    reviewer = FactoryGirl.create(:reviewer)
    cardsortresult = CardsortResult.create(:cardsort_id => cardsort.id, :card_id => card.id,
     :group_id => group.id, :reviewer_id => reviewer.id)
    o = helper.getOccurrences(cardsortresult.card, cardsortresult.group, cardsort)
    expect(o).to eq(1)
    expect(getGroupsAndCards([cardsortresult])).to eq([[group], [card]])
  end

  describe "methods that generate charts should return a chart" do 
    before(:each) do
      project = FactoryGirl.create(:project)
      @task = project.tasks.create(FactoryGirl.attributes_for(:task))
      @reviewer = @task.reviewers.create(FactoryGirl.attributes_for(:reviewer))
    end

    it "drawLinechart(resultsSummary, tasks, title) should return a chart" do
      @task.task_results.create(FactoryGirl.attributes_for(:task_result))
      resultsSummary = calculateResultsSummary([@task])
      timechart = helper.drawLinechart(resultsSummary[0], [@task], 'title')
      successchart = helper.drawLinechart(resultsSummary[1], [@task], 'title')
      expect(timechart).to be_kind_of(GoogleVisualr::Interactive::LineChart)
      expect(successchart).to be_kind_of(GoogleVisualr::Interactive::LineChart)
    end

    it "drawBarchart(tasks) should return a chart" do
      @task.task_results.create(FactoryGirl.attributes_for(:task_result))
      chart = helper.drawBarchart([@task])
      expect(chart).to be_kind_of(GoogleVisualr::Interactive::ColumnChart)
    end

    it "drawPiechart(tasks) should return a chart" do
      @reviewer.create_reviewer_info(FactoryGirl.attributes_for(:reviewer_info))
      reviewersinfos = getReviewerInfos(@task)
      agechart = drawPiechart(reviewersinfos[0], 'test')
      countrychart = drawPiechart(reviewersinfos[1], 'test')
      genderchart = drawPiechart(reviewersinfos[2], 'test')
      expect(agechart).to be_kind_of(GoogleVisualr::Interactive::PieChart)
      expect(genderchart).to be_kind_of(GoogleVisualr::Interactive::PieChart)
      expect(countrychart).to be_kind_of(GoogleVisualr::Interactive::PieChart)
    end
  end

  it "getQuestionResults(question) returns a chart" do
    question = Qquestion.create(:body => "TEST", :qtype => 3, :choices_attributes => [:body => "ChoiceA"])
    chart = helper.getQuestionResults(question, 3)
    expect(chart).to be_kind_of(GoogleVisualr::Interactive::PieChart)
  end
end