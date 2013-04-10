#encoding: utf-8
module TasksHelper

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
            occurrences[countries.index[r.reviewer_info.country]] += 1
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

  def compareAge(id)
    if Task.find(id).reviewers.length == 0
      return notice = "لم يتم احد المهمة"
    end

    a = b = c = d = 0

    Task.find(id).reviewers.each do |r|
      if r.reviewer_info != nil
        if r.reviewer_info.age !=nil 
          if r.reviewer_info.age < 20
            a += 1
          elsif r.reviewer_info.age < 40
            b += 1
          elsif r.reviewer_info.age < 60
            c += 1
          else 
            d += 1
          end
        end
      end    
    end

    if a == 0 && b == 0 && c == 0 && d == 0
      return notice = "لا توجد معلومات"
    end

    generatePieChart("Age", [a,b,c,d], ["< 20", "< 40", "< 60", "otherwise"])
  end

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
  def generatePieChart(title, data, labels)
    Gchart.pie_3d(:title => title, :size => '400x200',
              :data => data, :labels => labels)
  end

  def generateLineGraph ()
    
    data = pv.range(0, 10, 0.2).map {|x| 
      OpenStruct.new({:x=> x, :y=> Math.sin(x) + rand() + 1.5})
    }


    vis = pv.Panel.new().width(200).height(200);


    w = 400
    h = 200
    x = pv.Scale.linear(data, lambda {|d| d.x}).range(0, w)
      
    y = pv.Scale.linear(0, 4).range(0, h);

    #/* The root panel. */
    vis = pv.Panel.new()
        .width(w)
        .height(h)
        .bottom(20)
        .left(20)
        .right(10)
        .top(5);

    #/* X-axis ticks. */
    vis.add(pv.Rule)
        .data(x.ticks())
        .visible(lambda {|d|  d > 0})
        .left(x)
        .strokeStyle("#eee")
      .add(pv.Rule)
        .bottom(-5)
        .height(5)
        .strokeStyle("#000")
      .anchor("bottom").add(pv.Label)
      .text(x.tick_format)

    #/* Y-axis ticks. */
    vis.add(pv.Rule)
        .data(y.ticks(5))
        .bottom(y)
        .strokeStyle(lambda {|d| d!=0 ? "#eee" : "#000"})
      .anchor("left").add(pv.Label)
      .text(y.tick_format)

    #/* The line. */
    vis.add(pv.Line)
        .data(data)
        .interpolate("step-after")
        .left(lambda {|d| x.scale(d.x)})
        .bottom(lambda {|d| y.scale(d.y)})
        .lineWidth(3)

    vis.render()
    vis.to_svg
  end
end
