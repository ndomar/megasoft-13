// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


		function addPage(){
			document.write("Method addPage is called");
			
			var input =window.prompt("Please enter Page Name","");

			<% @param = capture do %>
			<%= javascript_tag "document.write(input);" %>
			<% end %>

			if(input != null){
				<%= p = Page.new() %>		
				<%= p.page_name = @param %>
				<%= p.project_id = @id %>
				<%= p.save() %>

				//try to check making that 1 line
				// var html_string = "<p>hello world</p>";
				// $('#iFrame').contents().find('#id_to_replace').html(html_string);
				// code to fill iframes
			}
		}
	
