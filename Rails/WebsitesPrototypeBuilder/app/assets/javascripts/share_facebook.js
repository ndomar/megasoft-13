//##
//#Connects to facebook through API then sends the user's messagage to be shared on their wall
//# * *Args* : void
//# * *Returns* : redirects to homepage
//#
      function postToFeed(message,link) {
        // calling the API ...
        var obj = {
          method: 'feed',
          redirect_uri: 'http://localhost:3000/',
          link: link,
          picture: 'http://www.blogcdn.com/downloadsquad.switched.com/media/2011/03/chrome-logo-1301044215.jpg',
          name: 'Arability',
          caption: 'Story title',
          description: message
        };
        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
//Add the next link to your page
//FB.init({appId: "346985668734261", status: true, cookie: true});