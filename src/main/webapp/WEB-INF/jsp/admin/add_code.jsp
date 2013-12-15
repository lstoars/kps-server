<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="/scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <link href="/scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet"/>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="/scripts/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
</head>
<body>
<div id="form1" class="liger-form">
    <div class="fields">
        <input data-type="text" data-label="生成张数" name="count">
        <li data-label="销售渠道" data-type="select" data-name="saleChannel" data-textField="saleChannel" data-width="200">
            <input class="editor" data-data="getSaleChannelData()" data-textField="Name" data-valueField="Code"/>
        </li>
        <input data-type="text" data-label="使用天数" name="term" id="term">
        <input data-type="text" data-label="短信条数" name="smsCount" id="sms_count">
    </div>
    <div class="buttons">
        <input data-text="保存" data-click="f_save" data-width="60"/>
        <input data-text="关闭" data-click="f_close" data-width="60"/>
    </div>
</div>
<script>
    function f_save() {
        var form = liger.get("form1");
        var data = form.getData();
        $.ajax({
            url: "/kps/admin/card/add",
            type: "post",
            dataType: "json",
            async: false,
            data: data,
            success: function (msg) {
                if (msg.result.success) {
                    $.ligerDialog.success("添加成功，成功添加"+msg.result.data+"张！");
                } else {
                    $.ligerDialog.error('添加失败');
                }
            }
        })
    }

    function getSaleChannelData() {
        return [
            { Name: '淘宝', Code: 'taobao' },
            { Name: '实体卡', Code: 'card' }
        ];
    }
</script>
</body>
</html>