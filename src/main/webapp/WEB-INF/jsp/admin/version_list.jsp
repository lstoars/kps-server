<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="/scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <link href="/scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet"/>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="/scripts/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script>
        var clientData = [
            { clientId: 'tools', text: '工具箱' },
            { clientId: 'sf', text: '搜房'}
        ];
        var qjsj = [
            {must: 'true', text: '是'},
            {must: 'false', text: '否'}
        ]
        $(f_initGrid);
        var manager, g;
        function f_initGrid() {
            g = manager = $("#maingrid").ligerGrid({
                        columns: [
                            { display: '客户端', width: 100, name: 'clientId', type: 'text',
                                editor: { type: 'select', data: clientData, valueField: 'clientId' },
                                render: function (item) {
                                    if (item.clientId == 'tools') return '工具箱';
                                    return '搜房';
                                }
                            },
                            { display: '版本号', name: 'version', width: 100, type: 'text', editor: { type: 'text'} },
                            { display: '下载地址', name: 'url', type: 'text', width: 200, editor: { type: 'text'} },
                            { display: '版本描述', name: 'versionInfo', type: 'text', width: 200, editor: { type: 'text'} },
                            { display: '强制升级', name: 'mustUpgrade', type: 'text', width: 50, editor: { type: 'select', data: qjsj, valueField: 'must'},
                                render: function (item) {
                                    if (parseInt(item.mustUpgrade)) return '是';
                                    return '否';
                                }
                            },
                            {display: '更新时间', name: 'modifyTime', type: 'date', format: 'yyyy年MM月dd'}
                        ],
                        enabledEdit: true, detailToEdit: true,
                        isScroll: false, frozen: false,
                        data: $.extend(true, {}), url: "/kps/admin/version/version_list",
                        width: '100%',
                        onAfterSubmitEdit: submitEdit
                    }
            )
        }

        function submitEdit(item) {
            $.ajax({
                url: "/kps/admin/version/update_version",
                type: "post",
                dataType: "json",
                data: {'id': item.record.id, 'clientId': item.record.clientId, 'version': item.record.version,
                    'versionInfo': item.record.versionInfo, 'mustUpgrade': item.record.mustUpgrade, 'url': item.record.url},
                success: function (msg) {
                    if (msg.success) {
                        $.ligerDialog.success("修改成功");
                    } else {
                        $.ligerDialog.error('修改失败');
                    }
                }
            })
        }
    </script>
</head>
<body>
<div id="maingrid" style="margin-top:20px"></div>
<br/>
</body>
</html>