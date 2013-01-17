var select2 = new Array(4);
for (i = 0; i < 4; i++)
{
    select2[i] = new Array();
}
select2[0][0] = new Option("请选择", " ");

select2[1][0] = new Option("PHP", " ");
select2[1][1] = new Option("ASP", " ");
select2[1][2] = new Option("JSP", " ");

select2[2][0] = new Option("C/C++", " ");
select2[2][1] = new Option("Java", " ");
select2[2][2] = new Option("C#", " ");

select2[3][0] = new Option("Perl", " ");
select2[3][1] = new Option("Ruby", " ");
select2[3][2] = new Option("Python", " ");

function redirect(x)
{
    var temp = document.frm.s2;
    for (i = 0; i < select2[x].length; i++)
    {
        temp.options[i] = new Option(select2[x][i].text,select2[x][i].value);
    }
    temp.options[0].selected = true;
}
