<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="/scripts/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <link href="/scripts/ligerUI/skins/Gray/css/all.css" rel="stylesheet"/>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="/scripts/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script>
        function save_news() {
            $("#form1").submit();
        }

        $(function () {
            window['g'] =
                    $("#maingrid4").ligerGrid({
                        columns: [
                            { display: '标题', name: 'title', align: 'left', width: 300, render: function (item) {
                                return "<a href=" + item.url + " target=_blank>" + item.title + "</a>";
                            } },
                            {display: '排序号', name: 'sortIndex', width: 80, editor: { type: 'int' }},
                            { display: '操作', isSort: false, width: 120, render: function (item) {
                                return "<a href='javascript:deleteNews(" + item.id + ")'>删除</a> ";
                            }
                            }

                        ], pageSize: 30,
                        data: $.extend(true, {}), enabledEdit: true,
                        width: '100%', height: '100%', rownumbers: true,
                        onAfterEdit: f_onAfterEdit,
                        url: "/kps/admin/news/news_list"
                    });

            $("#pageloading").hide();
        });

        function f_onAfterEdit(e) {
            if (e.column.name == "sortIndex") {
                $.ajax({
                    url: "/kps/admin/news/update_sort_index",
                    type: "post",
                    dataType: "json",
                    data: {'id': e.record.id, 'sortIndex': e.record.sortIndex},
                    success: function (msg) {
                        if (msg.success) {
                            $.ligerDialog.success("排序号修改成功");
                        } else {
                            $.ligerDialog.error('排序号修改失败');
                        }
                    }
                })
            }
        }

        function deleteNews(id) {
            window.location.href = "/kps/admin/news/del_news?id=" + id;
        }
    </script>
</head>
<body>
<form id="form1" class="liger-form" inputWidth="300" action="/kps/admin/news/save_news" method="post">
    <div class="fields">
        <input data-type="text" data-label="标题" name="title">
        <input data-type="text" data-label="URL" name="url">
    </div>
    <div class="buttons">
        <input data-text="保存" data-click="save_news" data-width="60"/>
    </div>
</form>

<div id="maingrid4" style="margin:0; padding:0"></div>
</body>
</html>