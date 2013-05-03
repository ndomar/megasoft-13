# encoding: utf-8
module StatisticsHelper

  ## 
  # returns the occurences of the card in the group
  # * *Args*    :
  #   -+card+->: card instance
  #   -+group+->: group instance
  # * *Returns* :
  #   - number of ocurrences of card in group
  #  
  def getOccurrences(card, group, cardsort, reviewer)
    count = 0
    group.cardsort_results.each do |result|
      if reviewer == nil
        if (result.card == card && result.cardsort == cardsort)
          count += 1
        end
      else
        if (result.card == card && result.cardsort == cardsort && result.reviewer == reviewer)
          count += 1
        end
      end
    end
    return count
  end

  ## 
  # returns list of groups and cards
  # * *Args*    :
  #   -+reviewer_infos+->: an array of reviewer infos
  #   -+type+->: type of the chart
  # * *Returns* :
  #   - an array of 2 arrays of the cards and groups with no duplicates
  #  
  def getGroupsAndCards(results)
    groups = []
    cards = []
    results.each do |result|
      if !groups.include?(result.group)
        groups[groups.length] = result.group
      end
      if !cards.include?(result.card)
        cards[cards.length] = result.card
      end
    end
    return [groups, cards]
  end

  ## 
  # uses googlechartsvisualr to make a pie chart of the questionnaire results
  # * *Args*    :
  #   -+question+->:an instance of Question
  # * *Returns* :
  #   - a pie chart
  #  
  def getQuestionResults(question, type)
    results = []
    choices = question.choices
    choices.each_with_index do |choice, index|
      results[index] = 0
    end
    if type == 3
      question.answer_questionnaires.each do |answer|
        index= nil
        choices.each do |choice|
          if choice.body == answer.body
            index = choices.index(choice)
          end
        end
        results[index] += 1
      end
    else
      question.answer_questionnaires.each do |answer|
        index = nil
        chosenchoices = answer.body.split(',')
        chosenchoices.each do |chosenchoice|
          choices.each do |choice|
            if choice.body == chosenchoice
              index = choices.index(choice)
            end
          end
          results[index] += 1
        end
      end
    end
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'choice' )
    data_table.new_column('number', 'value')
    results.each_with_index do |result, index|
      data_table.add_row([choices[index].body, result])
    end
    option = { 
      width: 500, 
      height: 150, 
      title: question.body,
      backgroundColor: "transparent", 
      titleTextStyle: {color: "white"},
      legend: {textStyle: {color: 'white'}},
      colors: ['rgb(80,0,0)', 'rgb(0,0,80)', 'rgb(0,80,0)', '003333', '663366', '333366', '3366CC'],
      chartArea:{width:"100%",height:"80%"}
    }
    chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)
    return chart
  end

  ## 
  # uses googlechartsvisualr to make a pie chart of the given data
  # * *Args*    :
  #   -+reviewer_infos+->: an array of reviewer infos
  #   -+type+->: type of the chart
  # * *Returns* :
  #   - a pie chart
  #  
  def drawPiechart(reviewer_infos, type)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', type )
    data_table.new_column('number', 'value')
    reviewer_infos[0].each_with_index do |info, index|
      data_table.add_row([reviewer_infos[0][index], reviewer_infos[1][index]])
    end
    option = { 
      width: 250, 
      height: 150, 
      title: type,
      backgroundColor: "transparent", 
      titleTextStyle: {color: "white"},
      legend: {textStyle: {color: 'white'}},
      colors: ['rgb(80,0,0)', 'rgb(0,0,80)', 'rgb(0,80,0)', '003333', '663366', '333366', '3366CC'],
      chartArea:{width:"100%",height:"80%"}
    }
    chart = GoogleVisualr::Interactive::PieChart.new(data_table, option)
    return chart
  end

  ## 
  # uses googlechartsvisualr to make a bar chart of the given data
  # * *Args*    :
  #   -+tasks+->: an array of all tasks
  # * *Returns* :
  #   - a bar chart
  #  
  def drawBarchart(tasks)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'اسم المهمة' )
    data_table.new_column('number', 'الوقت')
    data_table.new_column('number', 'نسبة النجاح')
    data_table.new_column('number', 'عدد المراجعين')
    resultsSummary = calculateAllTasksResultsSummary(tasks)
    tasks.each_with_index do |task, index|
      data_table.add_row([task.name,resultsSummary[0][index], 
        resultsSummary[1][index], resultsSummary[2][index]])
    end
    option = { 
      width: 600, 
      height: 350, 
      title: "مقارنة بين المهام",
      backgroundColor: "transparent", 
      titlePosition: 'in',
      titleTextStyle: {color: "white"},
      legend: {position: 'bottom', textStyle: {color: 'white'}},
      colors: ['rgb(80,0,0)', 'rgb(0,0,80)', 'rgb(0,80,0)', '003333', '663366', '333366', '3366CC'],
      hAxis: {textStyle: {color: 'white'}}
    }
    chart = GoogleVisualr::Interactive::ColumnChart.new(data_table, option)
    return chart
  end

  ## 
  # uses googlechartsvisualr to make a line chart of the given data
  # * *Args*    :
  #   -+tasks+->: an array of tasks
  #   -+title+->: title of the chart
  #   -+resultsSummary+->: an array containing the data
  # * *Returns* :
  #   - a line chart
  #  
  def drawLinechart(resultsSummary, tasks, title)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('number', 'عدد المراجعين')
    tasks.each do |task|
      data_table.new_column('number', task.name)
    end
    tasks.each_with_index do |task, index|
      resultsSummary[index].each_with_index do |time, timeindex|
        if data_table.rows[timeindex] == nil
          data_table.add_row()
          data_table.set_cell(timeindex, 0, timeindex)
        end
        data_table.set_cell(timeindex, index + 1, time) 
      end
    end
    option = { 
      width: 350, 
      height: 150, 
      title: title,
      backgroundColor: "transparent", 
      titleTextStyle: {color: "white"},
      legend: {textStyle: {color: 'white'}},
      colors: ['rgb(80,0,0)', 'rgb(0,0,80)', 'rgb(0,80,0)', '003333', '663366', '333366', '3366CC'],
      hAxis: {textStyle: {color: 'white'}}
    }
    chart = GoogleVisualr::Interactive::LineChart.new(data_table, option)
    return chart
  end

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
    averagetime = 0.0
    counter = 0.0
    task_results.each do |result|
      counter += 1.0
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
    averagesuccess = 0.0
    counter = 0.0
    task_results.each do |result|
      counter += 1.0
      if result.success
        averagesuccess += 1.0
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
    return resultsSummary
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
  # gets three arrays representing the reviewers info
  # * *Args*    :
  #   -+task+->: a certain task
  # * *Returns* :
  #   - an array containing three arrays that have the data of the reviewer info
  #
  def getReviewerInfos(task)
    if task.reviewers.length == 0
      return "لم يتم احد المهمة"
    else
      return [compareAge(task), compareCountry(task), compareGender(task)]
    end
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
        if reviewer.reviewer_info.age != nil
          if reviewer.reviewer_info.age < 20 
            agelessthan20 += 1
          elsif reviewer.reviewer_info.age < 40
            agelessthan40 += 1
          elsif reviewer.reviewer_info.age < 60 
            agelessthan60 += 1
          else
            agegreaterthan60 += 1
          end
        end
      end
    end
    if numberofReviewerInfos == 0
      return "لم يستكمل أحد المراجعين استمارة المعلومات الشخصية"
    elsif agelessthan20 == 0 && agelessthan40 == 0 && agelessthan60 == 0 && agegreaterthan60 == 0
      return "لم يجب أحد من المراجعين عن سنه"
    else
      return [['السن أقل من 20', 'السن أقل من 40', 'السن أقل من 60', 'السن أكثر من 60'], [agelessthan20, agelessthan40, agelessthan60, agegreaterthan60]]
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
        if reviewer.reviewer_info.country != nil
          if countries.length == 0
            countries[0] = reviewer.reviewer_info.country.capitalize
            occurrences[0] = 1
          elsif countries.include?(reviewer.reviewer_info.country.capitalize)
            occurrences[countries.index(reviewer.reviewer_info.country.capitalize)] += 1
          else
            countries[countries.length] = reviewer.reviewer_info.country.capitalize
            occurrences[occurrences.length] = 1
          end
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
        if reviewer.reviewer_info.gender != nil
          if reviewer.reviewer_info.gender == true
            males += 1
          else
            females += 1
          end
        end
      end
    end
    if numberofReviewerInfos == 0
      return "لم يستكمل أحد المراجعين استمارة المعلومات الشخصية"
    elsif males == 0 && females == 0
      return "لم يجب أحد من المراجعين عن نوعه"
    else
      return [['ذكر', 'أنثى'], [males, females]]
    end
  end
end