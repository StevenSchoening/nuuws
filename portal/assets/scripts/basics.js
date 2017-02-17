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


 });