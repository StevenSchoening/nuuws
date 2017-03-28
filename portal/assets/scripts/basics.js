/**
 * Created by Fa15Schoening on 27.01.2017.
 */

 jQuery(document).ready(function() {
    console.log( "javascript: basics file is ready!" );
    if(document.getElementById("articleOption_create")){
        var articleCreateTab = document.getElementById("articleOption_create");
    }
    if(document.getElementById("articleOption_search")){
        var articleSearchTab =  document.getElementById("articleOption_search");
    }
    if(document.getElementById("articleOption_change")) {
        var articleChangeTab = document.getElementById("articleOption_change");
    }
    if(document.getElementById("articleOption_delete")){
        var articleDeleteTab = document.getElementById("articleOption_delete");
    }
     if(document.getElementById("searchArticleContent")) {
         var searchArticleContent = document.getElementById("searchArticleContent");
     }
     if(document.getElementById("createArticleContent")) {
         var createArticleContent = document.getElementById("createArticleContent");
     }



    //onclick functions for article Management

     if(articleCreateTab) {
         articleCreateTab.onclick = function () {
             createArticleContent.style.display = "block";
             searchArticleContent.style.display = "none";
         }
     }

     if(articleSearchTab) {
         articleSearchTab.onclick = function () {
             searchArticleContent.style.display = "block";
             createArticleContent.style.display = "none";
         }
     }
     if(articleChangeTab){
         articleChangeTab.onclick = function () {
             createArticleContent.style.display = "none";
             searchArticleContent.style.display = "none";
         }
     }
     if(articleDeleteTab){
         articleDeleteTab.onclick = function () {
             createArticleContent.style.display = "none";
             searchArticleContent.style.display = "none";
         }
     }


//  Validating registration form
     $("#registerForm").submit(function (event)
     {
    //   reading user input
         var username  = $("input[name='username']").val(),
             password  = $("input[name='password']").val(),
             pwConf    = $("input[name='passwordConf']").val(),
             email     = $("input[name='email']").val(),
             birthdate = new Date($("input[name='birthdate']").val()),
             age       = calculateAge(birthdate);

         if(username.length <= 4)
         {
             alert('Benutzername muss mindestens 5 Zeichen enthalten!');
             event.preventDefault();
             return false;
         }

         if(password != pwConf)
         {
             alert('Passwörter stimmen nicht überein!');
             event.preventDefault();
             return false;
         }

         if(password.length <= 5)
         {
             alert('Passwort muss aus mindestens 6. Zeichen bestehen');
             event.preventDefault();
             return false;
         }

         if(!password.match(/[a-z]/))
         {
             alert('Passwort muss mindestens einen kleinen Buchstaben enthalten');
             event.preventDefault();
             return false;
         }

         if(!password.match(/[A-Z]/))
         {
             alert('Passwort muss mindestens einen großen Buchstaben enthalten');
             event.preventDefault();
             return false;
         }

         if(!password.match(/[0-9]/))
         {
             alert('Passwort muss mindestens eine Zahl enthalten');
             event.preventDefault();
             return false;
         }

     // Passwords need special characters?
         if(!password.match(/[^a-zA-Z0-9]/) && false)
         {
             alert('Passwort muss mindestens ein Sonderzeichen enthalten');
             event.preventDefault();
             return false;
         }

         if(!email.match(/[\@]/) || !email.match(/[\.]/))
         {
             alert('Bitte E-Mail überprüfen');
             event.preventDefault();
             return false;
         }

         if(age <= 13)
         {
             alert('Registrierung erst nach vollendung des 12. Lebensjahres möglich!');
             event.preventDefault();
             return false;
         }
     });
 });


function calculateAge(birthday)    // birthday is a date
{
    var ageDifMs = Date.now() - birthday.getTime(),
        ageDate = new Date(ageDifMs); // miliseconds from epoch

    return Math.abs(ageDate.getUTCFullYear() - 1970);
}