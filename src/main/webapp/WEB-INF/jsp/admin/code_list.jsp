<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="/scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <link href="/scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet"/>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="/scripts/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            window['g'] =
                    $("#maingrid4").ligerGrid({
                        columns: [
                            { display: '卡号', name: 'code', align: 'left', width: 120 },
                            { display: '创建时间', name: 'createTime', width: 120 },
                            { display: '使用天数', name: 'term', width: 70 },
                            { display: '短信条数', name: 'smsCount', width: 70 },
                            { display: '使用时间', name: 'useTime', width: 120, align: 'left' },
                            { display: '销售渠道', name: 'saleChannel', width: 120}
                        ], pageSize: 30,
                        data: $.extend(true, {}),
                        width: '100%', height: '100%', rownumbers: true,
                        url: "/kps/admin/card/code_list"
                    });

            $("#pageloading").hide();
        });
    </script>
</head>
<body>
<div id="maingrid4" style="margin:0; padding:0"></div>
</body>
</html>