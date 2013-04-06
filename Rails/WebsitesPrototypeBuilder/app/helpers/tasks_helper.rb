module TasksHelper
  def gender (id)
    reviewers = Task.find(id).reviewers

    m = 0
    f = 0

    reviewers.each do |r|

      if r.reviewer_info.gender == 0
        m += 1
      else
        f += 1
      end

    end

    data = [m,f]

    w = 100
    h = 100

    r = w / 2.0

    a = pv.Scale.linear(0, pv.sum(data)).range(0, 2 * Math::PI)

    #/* The root panel. */
    vis = pv.Panel.new()
        .width(w)
        .height(h);
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
        .text(lambda {|d| "%0.2f" %  d});

    vis.render();

    vis.to_svg
  end
end
