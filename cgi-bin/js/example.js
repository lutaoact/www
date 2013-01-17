var xmlhttp = false;
try
{
    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
}catch(e)
{
    try
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }catch (e2)
    {
        xmlhttp = false;
    }
}
if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
    xmlhttp = new XMLHttpRequest();
if (!xmlhttp)
    alert("error initializing XMLHttpRequest");
function loadXMLDoc()
{
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState == 4)
        {
            if (xmlhttp.status == 200)
            {
                document.getElementById("myDiv").innerHTML = xmlhttp.responseText.split("|")[1];
            }
            else
            {
                //alert("ready state is " + xmlhttp.readyState + " and response is " + xmlhttp.responseText);
                alert(xmlhttp.getAllResponseHeaders());
            }
        }
    }
    xmlhttp.open("GET", "1.txt", true);
    //xmlhttp.open("HEAD", "1.txt", true);
    //xmlhttp.open("POST", url, true);
    //xmlhttp.setRequestHeader("Content-Type", "text/xml");
    //xmlhttp.send();
    xmlhttp.send(xmlString);
}
