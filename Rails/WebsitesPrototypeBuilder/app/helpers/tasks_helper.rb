#encoding: utf-8
module TasksHelper
  ##
  # calculates average time taken per and average success and calls generateLineGraph method
  #* *Args*    :
  #   -+tasks+->: list of tasks
  #* *Returns*    :
  #   a call to method generateLineGraph
  #
  def calculateResultsSummary(tasks)
    timedata = []
    successdata = []
    maxnbrresults = []
    tasks.each do |id|
      if Task.find(id).reviewers.length == 0
        return notice = "لم يتم احد المهمة"
      end

      if Task.find(id).task_results.length == 0
        return notice = "لا توجد نتائج"
      end

      accumulatedaveragetime = calculateAverageTime(Task.find(id).task_results)
      accumulatedaveragesuccess = calculateAverageSuccess(Task.find(id).task_results)

      nbrofresults = Array.new(Task.find(id).task_results.length + 1){ |i| i }
      
      timedata[timedata.length] = accumulatedaveragetime
      successdata[successdata.length] = accumulatedaveragesuccess
      
      if maxnbrresults.length == 0
        maxnbrresults = nbrofresults
      elsif maxnbrresults.length < nbrofresults.length
        maxnbrresults = nbrofresults
      end

    end
    
    indexoftimemaximumrange = 0
    indexofsuccessmaximumrange = 0
    timemaximumrange = 0
    successmaximumrange = 0
    
    timedata.each do |d|
      if d.max > timemaximumrange
        timemaximumrange = d.max
        indexoftimemaximumrange = timedata.index(d)
      end
    end

    timelegend = []
    successlegend = []
    tasks.each do |task|
      timelegend[timelegend.length] = task.name
      successlegend[successlegend.length] = task.name
    end

    timetmp = timedata[indexoftimemaximumrange]
    timedata[indexoftimemaximumrange] = timedata [0]
    timedata[0] = timetmp
    timetmp = timelegend[indexoftimemaximumrange]
    timelegend[indexoftimemaximumrange] = timelegend[0]
    timelegend[0] = timetmp

    data = []
    data[data.length] = generateLine("الوقت", timedata, maxnbrresults, timelegend,[])
    data[data.length] = generateLine("نسبة النجاح", successdata, maxnbrresults, successlegend, [0.0, 0.2, 0.4, 0.6, 0.8, 1.0])

    return data
  end

  ##
  # calculates the average success by results
  #* *Args*    :
  #   -+results+->: a list of task results
  #* *Returns*    :
  #   accumulatedaveragesuccess : a list of accumulated average success
  #
  def calculateAverageSuccess(results)
    accumulatedaveragesuccess = [0.0]
    results.each do |result|
      length = accumulatedaveragesuccess.length
      if result.success
        if length == 1
          accumulatedaveragesuccess[1] = 1.0
        else
          accumulatedaveragesuccess[length] = (accumulatedaveragesuccess[length-1] + 1.0) / length
        end
      else
        if length == 1
          accumulatedaveragesuccess[1] = 0.0
        else
          accumulatedaveragesuccess[length] = (accumulatedaveragesuccess[length-1] + 0.0) / length
        end
      end
    end
    return accumulatedaveragesuccess  
  end

  ##
  # calculates the average time taken by reviewers
  #* *Args*    :
  #   -+results+->: a list of task results
  #* *Returns*    :
  #   accumulatedaveragetime : a list of accumulated average time
  #
  def calculateAverageTime(results)
    accumulatedaveragetime = [0]
    results.each do |result|
      length = accumulatedaveragetime.length
      if length == 1
        accumulatedaveragetime[length] = result.time
      else
        accumulatedaveragetime[length] = (accumulatedaveragetime[length-1] + result.time) / length
      end
    end

    return accumulatedaveragetime  

  end

  
  ##
  # generate a url to an image of the generated chart
  #* *Args*    :
  #   -+title+->: title of chart
  #   -+avgtime+->: array of average time taken per month
  #   -+labels+->: array of months
  #* *Returns*    :
  #   url for chart
  #
  def generateLine(title, data, count, legend, range)
    if range.length != 0
    Gchart.line(:title => title, :axis_with_labels => ['x', 'y'], :size => '450x200',
              :data => data, :axis_labels => [count, range], :legend => legend, :bg => 'efefef', :line_colors => "FF0000,00FF00")
    else
    Gchart.line(:title => title, :axis_with_labels => ['y'], :size => '450x200',
              :data => data, :labels => count, :legend => legend, :bg => 'efefef', :line_colors => "FF0000,00FF00")
    end  
  end

  ##
  # calculates the number of reviewers in each countrys
  #* *Args*    :
  #   -+id+->: id of task
  #* *Returns*    :
  #   a call for generatePieChart method
  #
  def compareCountry(id)
    if Task.find(id).reviewers.length == 0
      return notice = "لم يتم احد المهمة"
    end

    countries = []
    occurrences = []

    Task.find(id).reviewers.each do |r|
      if r.reviewer_info != nil
        if r. reviewer_info.country != nil
          if countries.include?r.reviewer_info.country
            occurrences[countries.index(r.reviewer_info.country)] += 1
          else
            countries[countries.length] = r.reviewer_info.country
            occurrences[countries.index(r.reviewer_info.country)] = 1
          end
        end
      end
    end

    if countries.length == 0
      return notice = "لا توجد معلومات"
    end

    generatePieChart("البلد", occurrences, countries)
  end

  ##
  # orders the ages of reviewers into four categories
  #* *Args*    :
  #   -+id+->: id of task
  #* *Returns*    :
  #   a call for generatePieChart method
  #
  def compareAge(id)
    if Task.find(id).reviewers.length == 0
      return notice = "لم يتم احد المهمة"
    end

    agelessthan20 = agelessthan40 = agelessthan60 = agegreaterthan60 = 0

    Task.find(id).reviewers.each do |r|
      if r.reviewer_info != nil
        if r.reviewer_info.age != nil 
          if r.reviewer_info.age < 20
            agelessthan20 += 1
          elsif r.reviewer_info.age < 40
            agelessthan40 += 1
          elsif r.reviewer_info.age < 60
            agelessthan60 += 1
          else 
            agegreaterthan60 += 1
          end
        end
      end    
    end

    if agelessthan20 == 0 && agelessthan40 == 0 && agelessthan60 == 0 && agegreaterthan60 == 0
      return notice = "لا توجد معلومات"
    end
    data = []
    labels = []
    if agelessthan20 != 0
      data [data.length] = agelessthan20
      labels[labels.length] = "<20"
    end
    if agelessthan40 != 0
      data [data.length] = agelessthan20
      labels[labels.length] = "<40"
    end
    if agelessthan60 != 0
      data [data.length] = agelessthan20
      labels[labels.length] = "<60"
    end
    if agegreaterthan60 != 0
      data [data.length] = agelessthan20
      labels[labels.length] = ">60"
    end
    generatePieChart("السن", data, labels)
  end

  ##
  # calculates the number of male reviewers versus female reviewers
  #* *Args*    :
  #   -+id+->: id of task
  #* *Returns*    :
  #   a call for generatePieChart method
  #
  def compareGender(id)
    if Task.find(id).reviewers.length == 0
      return notice = "لم يتم احد المهمة"
    end

    male = female = 0

    Task.find(id).reviewers.each do |r|
      if r.reviewer_info != nil
        if r.reviewer_info.gender != nil
          if r.reviewer_info.gender == true
            male += 1
          else 
            female += 1
          end
        end
      end
    end
    if male == 0 && female == 0
      return notice = "لا توجد معلومات"
    end

    data = []
    labels = []
    if male != 0
      data [data.length] = male
      labels[labels.length] = "ذكر"
    end
    if female != 0
      data [data.length] = female
      labels[labels.length] = "أنثى"
    end

    generatePieChart("النوع", data, labels)
  end

  ##
  # generate a url to an image of the generated chart
  #* *Args*    :
  #   -+title+->: title of chart
  #   -+data+->: array of data values
  #   -+labels+->: array of months
  #* *Returns*    :
  #   url for chart
  #
  def generatePieChart(title, data, labels)
    Gchart.pie_3d(:title => title, :size => '350x200',
              :data => data, :labels => labels)
  end
end
