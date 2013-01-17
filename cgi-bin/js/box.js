function product(a, b)
{
    x = a * b;
    return x;
}

function myfunction(txt1, txt2)
{
    document.write(txt1 + txt2);
    //alert(txt);
}

function disp_alert()
{
    alert("warning box" + '\n' + 'go on');
}

function show_confirm()
{
    var r = confirm("Press a button");
    if (r == true)
    {
        alert("You pressed OK!");
    }
    else
    {
        alert("You pressed Cancel!");
    }
}

function disp_prompt()
{
    var name = prompt("请输入你的名字", "Lei Feng");
    if (name != null && name != "")
    {
        document.write("你好！" + name + " 今天过得怎么样？");
    }
}
