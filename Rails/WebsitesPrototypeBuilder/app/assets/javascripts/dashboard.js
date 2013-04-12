//##
//#Connects to facebook through API then sends the user's messagage to be shared on their wall
//# * *Args* : void
//# * *Returns* : redirects to homepage
//#
function postToFeed() {

	        // calling the API ...
	        var obj = {
	          method: 'feed',
	          redirect_uri: 'http://localhost:3000',
	          link: 'https://developers.facebook.com/docs/reference/dialogs/',
	          picture: 'http://fbrell.com/f8.jpg',
	          name: 'Facebook Dialogs',
	          caption: 'Reference Documentation',
	          description: 'Using Dialogs to interact with users.'
	        };

	        function callback(response) {
	          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
	        }

	        FB.ui(obj, callback);
	      }