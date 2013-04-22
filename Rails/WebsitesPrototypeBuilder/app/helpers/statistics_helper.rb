# encoding: utf-8
module StatisticsHelper
  ## 
  # calculates the results summary of all tasks
  # * *Args*    :
  #   -+tasks+->: an array of tasks
  # * *Returns* :
  #   - an array containing 3 arrays that where each cell in those arrays represents
  #   - either the average time or success or number of reviewers of one task
  #  
  def calculateAllTasksResultsSummary(tasks)
    allTasksAverageTime = []
    allTasksAverageSuccess = []
    numberofReviewers = []
    resultsSummary = [allTasksAverageTime, allTasksAverageSuccess, numberofReviewers]
    tasks.each do |task|
      if task.reviewers.length == 0 || task.task_results.length == 0
        allTasksAverageTime[allTasksAverageTime.length] = 0
        allTasksAverageSuccess[allTasksAverageSuccess.length] = 0
        numberofReviewers[numberofReviewers.length] = 0
      else
        allTasksAverageTime[allTasksAverageTime.length] = calculateAverageTime(task.task_results)
        allTasksAverageSuccess[allTasksAverageSuccess.length] = calculateAverageSuccess(task.task_results)
        numberofReviewers[numberofReviewers.length] = task.reviewers.length
      end
    end
    return resultsSummary
  end

  ## 
  # calculates the average time taken by reviewers of a set of task results
  # * *Args*    :
  #   -+tasks+->: an array of tasks
  # * *Returns* :
  #   - a value that represents the average time taken by reviewers of one task
  #   
  def calculateAverageTime(task_results)
    averagetime = 0
    counter = 0
    task_results.each do |result|
      counter += 1
      averagetime += result.time
    end
    averagetime /= counter
    return averagetime
  end

  ## 
  # calculates the average success a set of task results
  # * *Args*    :
  #   -+tasks+->: an array of tasks
  # * *Returns* :
  #   - a value that represents the average success of one task
  #   
  def calculateAverageSuccess(task_results)
    averagesuccess = 0
    counter = 0
    task_results.each do |result|
      counter += 1
      if result.success
        averagesuccess += 1
      end
    end
    averagesuccess /= counter
    return averagesuccess
  end

  ## 
  # calculates the accumulated average time taken by reviewers for a set of task results
  # * *Args*    :
  #   -+tasks+->: an array of tasks
  # * *Returns* :
  #   - an array of 2 arrays, the first has an array of the accumulated averagetime of each task, 
  #   - while the second contains arrays of the accumulated averagesuccess of each task.
  #  
  def calculateResultsSummary(tasks)
    allTasksAverageTime = []
    allTasksAverageSuccess = []
    resultsSummary = [allTasksAverageTime, allTasksAverageSuccess]
    tasks.each do |task|
      if task.reviewers.length == 0
        return "لم يتم احد المهمة"
      end
      if task.task_results.length == 0
        return "لا توجد نتائج"
      end
      allTasksAverageTime[allTasksAverageTime.length] = calculateAccumulatedAverageTime(task.task_results)
      allTasksAverageSuccess[allTasksAverageSuccess.length]= calculateAccumulatedAverageSuccess(task.task_results)
    end
  end

  ## 
  # calculates the accumulated average time taken by reviewers for a set of task results
  # * *Args*    :
  #   -+task_results+->: an array of task results
  # * *Returns* :
  #   - an array of accumulated average time 
  #
  def calculateAccumulatedAverageTime(task_results)
    accumulatedAverageTime = [0.0]
    task_results.each do |result|
      length = accumulatedAverageTime.length
      accumulatedAverageTime[length] = (accumulatedAverageTime[length-1] + result.time) / length
    end
    return accumulatedAverageTime
  end
  
  ## 
  # calculates the accumulated average success for a set of task results
  # * *Args*    :
  #   -+task_results+->: an array of task results
  # * *Returns* :
  #   - an array of accumulated average success 
  #
  def calculateAccumulatedAverageSuccess(task_results)
    accumulatedAverageSuccess = [0.0]
    task_results.each do |result|
      length = accumulatedAverageSuccess.length
      if result.success
        accumulatedAverageSuccess[length] = (accumulatedAverageSuccess[length-1] + 1) / length
      else
        accumulatedAverageSuccess[length] = accumulatedAverageSuccess[length-1] / length
      end
    end
    return accumulatedAverageSuccess
  end

  ## 
  # calculates the number of reviewers in each age category
  # * *Args*    :
  #   -+task+->: a certain task
  # * *Returns* :
  #   - an array containing the number of reviewers in 4 age categories
  #
  def compareAge(task)
    agelessthan20 = agelessthan40 = agelessthan60 = agegreaterthan60 = 0
    reviewers = task.reviewers
    numberofReviewerInfos = 0
    reviewers.each do |reviewer|
      if reviewer.reviewer_info != nil
        numberofReviewerInfos += 1
        if reviewer.reviewer_info.age < 20 
          agelessthan20 += 1
        elsif reviewer.age < 40
          agelessthan40 += 1
        elsif reviewer.age < 60 
          agelessthan60 += 1
        else
          agegreaterthan60 += 1
        end
      end
    end
    if numberofReviewerInfos == 0
      return "لم يستكمل أحد المراجعين استمارة المعلومات الشخصية"
    elsif agelessthan20 == agelessthan40 == agelessthan60 == agegreaterthan60 == 0
      return "لم يجب أحد من المراجعين عن سنه"
    else
      return [agelessthan20, agelessthan40, agelessthan60, agegreaterthan60]
    end
  end
  
  ## 
  # calculates the number of reviewers in each country
  # * *Args*    :
  #   -+task+->: a certain task
  # * *Returns* :
  #   - an array containing 2 arrays, one with the countries names and the other with the occurrences
  #
  def compareCountry(task)
    countries = []
    occurrences = []
    reviewers = task.reviewers
    numberofReviewerInfos = 0
    reviewers.each do |reviewer|
      if (reviewer.reviewer_info != nil)
        numberofReviewerInfos += 1
        if countries.include(reviewer.reviewer_info.country)
          occurrences[countries.index(reviewer.reviewer_info.country)] += 1
        else
          countries[countries.length] = reviewer.reviewer_info.country
          occurrences[occurrences.length] = 1
        end
      end
    end
    if numberofReviewerInfos == 0
      return "لم يستكمل أحد المراجعين استمارة المعلومات الشخصية"
    elsif countries.length == 0
      return "لم يجب أحد من المراجعين عن بلده"
    else
      return [countries, occurrences]
    end
  end

  ## 
  # calculates the number of males and females in reviewers list
  # * *Args*    :
  #   -+task+->: a certain task
  # * *Returns* :
  #   - an array containing the number of males and females
  #
  def compareGender(task)
    males = females = 0
    reviewers = task.reviewers
    numberofReviewerInfos = 0
    reviewers.each do |reviewer|
      if reviewer.reviewer_info != nil
        numberofReviewerInfos += 1
        if reviewer.reviewer_info.gender == true
          males += 1
        else
          females += 1
        end
      end
    end
    if numberofReviewerInfos == 0
      return "لم يستكمل أحد المراجعين استمارة المعلومات الشخصية"
    elsif males == females == 0
      return "لم يجب أحد من المراجعين عن نوعه"
    else
      return [males, females]
    end
  end
end