var select_styles = '<style type="text/css">.ui-autocomplete{background:#fff;border:1px solid #7f9db9;position:absolute;z-index:99999;top:21px;left:1px;max-height:150px;overflow-y:auto;overflow-x:hidden;display:none}.ui-autocomplete a{display:block;padding:0 5px;width:100%;height:22px;line-height:22px;overflow:hidden;text-indent:5px;color:#333}.ui-autocomplete div{color:#f00;height:22px;line-height:22px;text-align:center;}.ui-autocomplete a:hover{background:#f0f0f0}.ui-autocomplete a.getaway,.ui-autocomplete a.getaway:hover{color:#f00;}</style>';
$('head').append(select_styles);
$.ajax({
    url: "/scripts/jquery-autocom.min.js",
    dataType: "script",
    async: false
});

function getCommunity(options) {
    options = options || {};
    var _thisId = $('#' + options.thisId + ''),
    noData = {name: "没有数据"},
    htmls = '', wrap = $('<div class="workname-select"></div>');

    _thisId.autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                url: "/kps/tools/query_community",
                dataType: 'json',
                data: {keys: $.trim(_thisId.val())},
                success: function (data) {
                    if (data.infos) {
                        response($.map(data.infos, function (item) {
                            return {
                                name: item.name,
                                traffic: item.traffic,
                                supports: item.supports,
                                description: item.description,
                            }
                        }));
                    } else {
                        response($.map(noData, function (item) {
                            return {
                                name: "没有数据",
                            }
                        }));
                    }
                }
            });
        },
        minLength: 1,
        select: function (event, ui) {
            $("#community_show_area").html("");
            if (ui.item.name == noData.name) {
                return false;
            } else {
                _thisId.val(ui.item.name);
                options.trafficId ? $("#" + options.trafficId + "").html(ui.item.traffic) : null;
                options.supportsId ? $("#" + options.supportsId + "").html(ui.item.supports) : null;
                options.descriptionId ? $("#" + options.descriptionId + "").html(ui.item.description) : null;
                $("#community_show_area").html($("#community_copy_content").html());
            }
        }
    }).data("ui-autocomplete")._renderItem = function (ul, item) {
        var e = $("<li>"), deptName = item.deptName || '';
        return  e.append("<a href='javascript:;' title=" + item.name + ">" + item.name + "</a>"), e.appendTo(ul);
    };
}