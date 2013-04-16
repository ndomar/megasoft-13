#encoding: utf-8
module TasksHelper
  ##
  # calculates average time taken per each month anc calls generateLineGraph method
  #* *Args*    :
  #   -+id+->: id of the particular task
  #* *Returns*    :
  #   a call to method generateLineGraph
  #
  def avgtime(id)
    if Task.find(id).reviewers.length == 0
      return notice = "لم يتم احد المهمة"
    end

    if Task.find(id).task_results.length == 0
      return notice = "لا توجد نتائج"
    end

    months = []
    avgtime = []
    count = []

    Task.find(id).task_results.each do |t|
      month = t.created_at.strftime("%B")
      if months.include?(month)
        avgtime[months.index(month)] += t.time
        count[months.index(month)] += 1
      else
        months[months.length] = month
        avgtime[months.index(month)] = t.time
        count[months.index(month)] = 1.0
      end
    end

    avgtime.each do |a|
      avgtime[avgtime.index(a)] = a/count[avgtime.index(a)]
    end

    generateLineGraph("Average time taken", avgtime, months)

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
  def generateLineGraph(title, avgtime, labels)
    Gchart.line(:title => title, :axis_with_labels => 'y', :size => '600x200',
              :data => avgtime, :labels => labels, :stacked => false)
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

    generatePieChart("Countries", occurrences, countries)
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
    
    generatePieChart("Age", data, labels)
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

    m = f = 0

    Task.find(id).reviewers.each do |r|
      if r.reviewer_info != nil
        if r.reviewer_info.gender != nil
          if r.reviewer_info.gender == true
            m += 1
          else 
            f += 1
          end
        end
      end
    end
    if m == 0 && f == 0
      return notice = "لا توجد معلومات"
    end

    generatePieChart("Gender", [m,f], ["Male", "Female"])
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
    Gchart.pie_3d(:title => title, :size => '400x200',
              :data => data, :labels => labels)
  end
end
