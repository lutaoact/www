$(function() {
    goLightning();
    window.onblur = stopLightning;
    window.onfocus = goLightning;

    $("#btnRandom").click(randomize);
    $("#btnReset").click(reset);

    $("#head").click(function() {
        moveMe(0, this);
    });

    $("#eyes").click(function() {
        moveMe(1, this);
    });

    $("#nose").click(function() {
        moveMe(2, this);
    });

    $("#mouth").click(function() {
        moveMe(3, this);
    });
});

function getRandom(num) {
    var my_num = Math.floor(Math.random() * num);
    return my_num;
}

var clix = [0, 0, 0, 0];

var WIDTH = 367;
var MONSTER_NUM = 10;
function randomize() {
    $(".face").each(function(index) {
        var target_position = getRandom(MONSTER_NUM);
        var current_position = clix[index];
        clix[index] = target_position;
        var move_to = target_position * WIDTH;
        $(this).animate({left: "-" + move_to + "px"}, 500);
        /*if(target_position > current_position) {
            var move_to = (target_position - current_position) * WIDTH;
            $(this).animate({left: "-=" + move_to + "px"}, 500);
        } else if (target_position < current_position){
            var move_to = (current_position - target_position) * WIDTH;
            $(this).animate({left: "+=" + move_to + "px"}, 500);
        }*/
    });
}

function reset() {
    $(".face").each(function(index) {
        clix[index] = 0;
        $(this).animate({left: "0px"}, 500);
    });
}

function moveMe(i, obj) {
    if(clix[i] < 9) {
        $(obj).animate({left: "-=367px"}, 500);
        clix[i]++;
    } else {
        clix[i] = 0;
        $(obj).animate({left: "0px"}, 500);
    }
}

var int1, int2, int3;
function stopLightning() {
    window.clearInterval(int1);
    window.clearInterval(int2);
    window.clearInterval(int3);
}

function goLightning() {
    int1 = setInterval(function() {
        lightning_one()
        },
        4000
    );
    int2 = setInterval(function() {
        lightning_two()
        },
        5000
    );
    int3 = setInterval(function() {
        lightning_three()
        },
        7000
    );
}

function lightning_one() {
    $("#container #lightning1").fadeIn(250).fadeOut(250);
}

function lightning_two() {
    $("#container #lightning2").fadeIn(250).fadeOut(250);
}

function lightning_three() {
    $("#container #lightning3").fadeIn(250).fadeOut(250);
}
