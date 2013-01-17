var x = prompt("请输入0至10之间的数：", "");
try
{
    if (x > 10)
        throw "Err1";
    else if (x < 0)
        throw "Err2";
    else if (isNaN(x))
        throw "Err3";
    else
        throw "Err4";
}
catch(err)
{
    if (err == "Err1")
        alert("太大了");
    else if (err == "Err2")
        alert("太小了");
    else if (err == "Err3")
        alert("不是数字");
    else
        alert("空的诶");
}
