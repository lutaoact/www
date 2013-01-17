function func()
{
var myDocument = document;
var htmlElement = myDocument.documentElement;
alert("the root element of the page is " + htmlElement.nodeName);
//console.log("32jjl");
var headElement = htmlElement.getElementsByTagName("head")[0];
alert("the head element named " + headElement.nodeName);
var pElement = htmlElement.getElementsByTagName("p")[0];
//var bodyElement = htmlElement.getElementsByTagName("body")[0];
//var bodyElement = headElement.nextSibling;
/*while(bodyElement.nodeName.toLowerCase() != "body")
{
    bodyElement = bodyElement.nextSibling;
}*/
//alert("the body element named " + bodyElement.nodeName);
alert("the p element named " + pElement.nodeName);
}
