/**
 * Created with IntelliJ IDEA.
 * User: renming
 * Date: 13-12-9
 * Time: 下午1:40
 * To change this template use File | Settings | File Templates.
 */
function stop() {
    return false;
}
document.oncontextmenu = stop;

function copyContent(div) {
    try {
        var controlRange;
        if (document.body.createControlRange) {
            controlRange = document.body.createControlRange();
            controlRange.addElement(div);
            controlRange.execCommand('Copy');
            alert("复制成功，到网站粘贴(Ctrl+V)即可。")
        } else {
            alert("复制失败。")
        }
    }catch(e) {
        alert("复制失败了,"+e)
    }
}

function copyContent2(div) {
    div.contentEditable = 'false';
    try {
        var controlRange;
        if (document.body.createControlRange) {
            controlRange = document.body.createControlRange();
            controlRange.addElement(div);
            controlRange.execCommand('Copy');
            alert("复制成功，到网站粘贴(Ctrl+V)即可。")
        } else {
            alert("复制失败。")
        }
    }catch(e) {
        alert("复制失败了,"+e)
    }
    div.contentEditable = 'false';

}

function checkMobile(mobile) {
    var reg0 = /^13\d{9}$/;  // 130--139。至少7位
    var reg1 = /^15\d{9}$/;  // 联通150-159。至少7位
    var reg2 = /^18\d{9}$/;  // 移动180-189。至少7位
    var reg3 = /^14\d{9}$/;  // 移动140-149。至少7位
    var reg4 = /^00852\d{5,15}$/;  //香港的手机号码
    var reg5 = /^00853\d{5,15}$/; //澳门的手机号码
    var reg6 = /^00886\d{5,15}$/; //台湾的手机号码
    var my = false;
    if (reg0.test(mobile))my = true;
    if (reg1.test(mobile))my = true;
    if (reg2.test(mobile))my = true;
    if (reg3.test(mobile))my = true;
    if (reg4.test(mobile))my = true;
    if (reg5.test(mobile))my = true;
    if (reg6.test(mobile))my = true;
    return my;
}

/**
 * 替换字符
 */
String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
};