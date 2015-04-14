function doBilloAuth() {
  console.log("authing ...");
  auth2 = gapi.auth2.init({
      'client_id': '894790475948-71igkfabjstv8ohtj3ak8emilql9q9l4.apps.googleusercontent.com',
  });
}

function start() {
  console.log("starting ...");
    gapi.load('auth2', doBilloAuth)
}

function doBilloSignIn(event) {
  console.log("signing in ...");
  auth2.grantOfflineAccess({'redirect_uri': 'http://login.billo.systems/validate'});
  //auth2.grantOfflineAccess({'redirect_uri': 'http://login.billo.systems/validate'}).then(signInCallback);
}

function doBilloSignOut(event) {
  console.log("signing out ...");
  auth2.disconnect();
}

function signInCallback(authResult) {
  console.log("doing sign-in callback ...");
  if (authResult['code']) {

    // Hide the sign-in button now that the user is authorized, for example:
    $('#signInBtn').attr('style', 'display: none');

    // Send the code to the server
    $.ajax({
      type: 'POST',
      url: 'http://login.billo.systems/validate',
      contentType: 'application/octet-stream; charset=utf-8',
      success: function(result) {
        // Handle or verify the server response.
      },
      processData: false,
      data: authResult['code']
    });
  } else {
    // There was an error.
  }
}
