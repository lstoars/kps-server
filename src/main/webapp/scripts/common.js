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
    div.contentEditable = 'true';

    var controlRange;
    if (document.body.createControlRange) {
        controlRange = document.body.createControlRange();
        controlRange.addElement(div);
        controlRange.execCommand('Copy');
        alert("复制成功。")
    } else {
        alert("复制失败。")
    }
    div.contentEditable = 'false';

}

/**
 * 替换字符
 */
String.prototype.replaceAll = function (s1, s2) {
    return this.replace(new RegExp(s1, "gm"), s2);
};