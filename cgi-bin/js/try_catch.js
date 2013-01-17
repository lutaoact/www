var txt="";
function message()
{
    try
    {
        adddlert("welcome guest!");
    }
    catch(err)
    {
        txt = "本页中存在错误。\n\n";
        txt +=  "错误描述：" + err.description + "\n\n";
        txt += "点击“确定”继续。\n\n";
        //alert(txt);
        if (!confirm(txt))
        {
            document.location.href="js/try_catch.js";
        }
        else
        {
            document.location.href="http://www.w3school.com.cn";
        }
    }
}
