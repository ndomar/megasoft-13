 function postToFeed(message,link,title) {
        // calling the API ...
        var obj = {
          method: 'feed',
          redirect_uri: 'http://localhost:3000/',
          link: link,
          picture: 'http://s14.postimg.org/upf4f0n7h/logo.png',
          name: 'Arability',
          caption: title ,
          description: message
        };
        function callback(response) {
          document.getElementById('msg').innerHTML = "Post ID: " + response['post_id'];
        }

        FB.ui(obj, callback);
      }
    
