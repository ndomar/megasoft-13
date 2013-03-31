#redireced to dashboard after logging in
#actions for the dashboard views
class DashboardController < ApplicationController
#making sure that the user is signed in before loading the page
before_filter :authenticate_designer!
 
def index    
end

end
