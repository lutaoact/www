var d = new Date();
var time = d.getHours();

if (time < 10)
{
    document.write(time);
    document.write("<b>早安</b>");
}
else if (time > 10 && time < 16)
{
    document.write(time);
    document.write("<b>愉快</b>");
}
else
{
    document.write(time);
    document.write("<b>hello world</b>");
}
