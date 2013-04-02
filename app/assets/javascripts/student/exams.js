//显示时钟
var seconds_remain = 120 * 60;

function calltimer(minutes_remain) {
    seconds_remain = minutes_remain * 60 ;
    timereduce();
}

function timereduce() {
    seconds_remain -= 1;
    if(seconds_remain <= 0){
        document.forms[0].submit();
    }
    if(document.all) {
    thissecond = seconds_remain % 60;
    thissecond = thissecond < 10? "0"+thissecond : ""+thissecond;
    thistime = Math.floor(seconds_remain / 60)+":"+ thissecond;
    remain.innerHTML= (thistime);
    }    
    if(document.layers) {
    document.remain.document.write('<span id="remain">'+thistime+'</span>');
    document.close();
    }
    var timer=setTimeout("timereduce()",1000);
}



