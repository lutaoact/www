var x;
var mycars = new Array();
mycars[0] = "saab";
mycars[1] = "volvo";
mycars[2] = "BMW";
for (x in mycars)
{
    document.write(x + "<br />");
}//x从0开始增加
/*
for (i = 0; i <= 5; i++)
{
    document.write(i);
    document.write("<br />");
}
*/
