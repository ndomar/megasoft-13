module TasksHelper

  def country(id)

    

  end

  def gender(id)
    reviewers = Task.find(id).reviewers

    m = 0
    f = 0

    reviewers.each do |r|
      if r.reviewer_info.gender == true
        m += 1
      else
        f += 1
      end
    end

    data = [m,f]

    pichart(id, data)
  end

  def age(id)
    reviewers = Task.find(id).reviewers
    fst = snd = thrd = frth = 0

    reviewers.each do |r|
      if r.reviewer_info.age != nil
        if r.reviewer_info.age < 20
          fst += 1
        else
          if r.reviewer_info.age < 40
            snd += 1
          else
            if r.reviewer_info.age < 60
              thrd += 1
            else
              frth += 1
            end
          end
        end
      end
    end

    data = [fst, snd, thrd, frth]

    pichart(id, data)
  end

  def pichart(id, data)
    
    w = 100
    h = 100

    r = w / 2.0

    a = pv.Scale.linear(0, pv.sum(data)).range(0, 2 * Math::PI)

    #/* The root panel. */
    vis = pv.Panel.new()
        .width(w)
        .height(h)
    #/* The wedge, with centered label. */

    vis.add(pv.Wedge)
        .data(data.sort(&pv.reverse_order))
        .bottom(w / 2.0)
        .left(w / 2.0)
        .innerRadius(0)
        .outerRadius(r)
        .angle(a)
        .event("mouseover", lambda {self.inner_radius(0)})
        .event("mouseout", lambda{ self.inner_radius(r - 40)})
      .anchor("center").add(pv.Label)
      .visible(lambda {|d|  d > 0.15})
        .textAngle(0)
        .text(lambda {|d| "%0.2f" %  d})

    vis.render()

    vis.to_svg
  end
end
