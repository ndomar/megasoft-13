class TestsController < ApplicationController
  def test_scan
  	puts "sdassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
  	@page = Page.new(:page_name => "sad", :project_id => 1)
  	@page.save
  	p @page
  	#@page.delay.take_screenshot("http://www.google.com");
  end
end
