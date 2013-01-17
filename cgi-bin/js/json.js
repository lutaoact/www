function func()
{
var JSONObject =
{
    "name":"Bill Gates",
    "street":"Fifth Avenue",
    "age":56,
    "phone":"555 1234567"
};
document.getElementById("jname").innerHTML=JSONObject.name;
document.getElementById("jage").innerHTML=JSONObject.age;
document.getElementById("jstreet").innerHTML=JSONObject.street;
document.getElementById("jphone").innerHTML=JSONObject.phone;
var myString = JSONObject.toString();
//document.write(myString);
//document.write(JSONObject);
}
