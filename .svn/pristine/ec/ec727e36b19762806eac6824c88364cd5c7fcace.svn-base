<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>OrosCapital - Client</title>
</head>

<body>
<div class="page-header">
    <h1>Chart Categories (Treeview)</h1>
</div><!-- /.page-header -->

<g:if test="${flash.message}">
    <div class="alert alert-success">
        <i class="icon-bell green"><b>${flash.message}</b></i> <a class="close" data-dismiss="alert">×</a>
    </div>
</g:if>

<div class="col-xs-12 col-md-12">
    <div class="widget-box">
        <div class="widget-header header-color-blue2">
            <h4 class="lighter smaller">Chart Class <i class="icon-double-angle-right"></i> Chart Group
                <i class="icon-double-angle-right"></i> Chart Master</h4>
        </div>

        <div class="widget-body">
            <div class="widget-main padding-8">
                <div id="main">
                    <ul id="navigation">
                        <g:each var="chartClass" in="${chartClassLists}" status="i">
                            <li class="tree-folder-name">
                                <a href="${createLink(controller: 'chartClass', action: 'edit')}" class="chart" id="${chartClass.id}">${chartClass?.name}</a>
                                <ul>
                                    <g:each in="${chartClassLists.chartGroups[i]}" var="chartGroup" status="j">
                                        <g:if test="${chartGroup.parentGroupId == null}">
                                            <li>%{-- A group --}%
                                                <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${chartGroup.id}">${chartGroup.name}</a>
                                                <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${chartGroup.id}"><span class="glyphicon glyphicon-plus"></span></a>                                                <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${chartGroup.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                <ul>
                                                %{-- A1 --}%
                                                    <g:each in="${chartClassLists.chartGroups[i].parentGroups[j]}" var="parentGroup" status="k">
                                                        <li>
                                                            <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGroup.id}">${parentGroup.name}</a>
                                                            <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${parentGroup.id}"><span class="glyphicon glyphicon-plus"></span></a>

                                                            <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGroup.id}"><span class="glyphicon glyphicon-plus"></span></a>

                                                            %{-- A2 --}%
                                                            <ul>
                                                                <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k]}" var="parentGrouP" status="n">
                                                                    <li>
                                                                        <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGrouP.id}">${parentGrouP.name}</a>
                                                                        <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${parentGrouP.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                        <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGrouP.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                        <ul>%{-- A3 group --}%
                                                                            <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n]}" var="parentGroupThird" status="m">
                                                                                <li>
                                                                                    <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGroupThird.id}">${parentGroupThird.name}</a>
                                                                                    <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${parentGroupThird.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                    <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGroupThird.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                    <ul>
                                                                                    %{-- A4 group --}%
                                                                                        <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m]}" var="parentGroupFourth" status="o">
                                                                                            <li>
                                                                                                <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGroupFourth.id}">${parentGroupFourth.name}</a>
                                                                                                <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${parentGroupFourth.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                                <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGroupFourth.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                                <ul>
                                                                                                %{-- A5 group --}%
                                                                                                    <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m].parentGroups[o]}" var="parentGroupFifth" status="p">
                                                                                                        <li>
                                                                                                            <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGroupFifth.id}">${parentGroupFifth.name}</a>
                                                                                                            <a href="${createLink(controller: 'chartGroup', action: 'subGroupCreate')}" class="chart" title="Add Chart Group" id="${parentGroupFifth.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                                            <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGroupFifth.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                                            <ul>
                                                                                                            %{-- A6 group --}%
                                                                                                                <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m].parentGroups[o].parentGroups[p]}" var="parentGroupSixth" status="q">
                                                                                                                    <li>
                                                                                                                        <a href="${createLink(controller: 'chartGroup', action: 'edit')}" class="chart" id="${parentGroupSixth.id}">${parentGroupSixth.name}</a>
                                                                                                                        <a href="${createLink(controller: 'chartMaster', action: 'create')}" class="chart" title="Add Chart Master" id="${parentGroupSixth.id}"><span class="glyphicon glyphicon-plus"></span></a>
                                                                                                                        <ul>
                                                                                                                        %{-- A6 master --}%
                                                                                                                            <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m].parentGroups[o].parentGroups[p].chartMasters[q]}" var="chartMaster">
                                                                                                                                <li>
                                                                                                                                    <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                                                                                    <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                                                                                </li>
                                                                                                                            </g:each>
                                                                                                                        </ul>
                                                                                                                    </li>
                                                                                                                </g:each>
                                                                                                            %{-- A5 master --}%
                                                                                                                <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m].parentGroups[o].chartMasters[p]}" var="chartMaster">
                                                                                                                    <li>
                                                                                                                        <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                                                                        <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                                                                    </li>
                                                                                                                </g:each>
                                                                                                            </ul>
                                                                                                        </li>
                                                                                                    </g:each>
                                                                                                %{-- A4 master --}%
                                                                                                    <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].parentGroups[m].chartMasters[o]}" var="chartMaster">
                                                                                                        <li>
                                                                                                            <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                                                            <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                                                        </li>
                                                                                                    </g:each>
                                                                                                </ul>
                                                                                            </li>
                                                                                        </g:each>
                                                                                    %{-- A3 master --}%
                                                                                        <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].parentGroups[n].chartMasters[m]}" var="chartMaster">
                                                                                            <li>
                                                                                                <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                                                <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                                            </li>
                                                                                        </g:each>
                                                                                    </ul>
                                                                                </li>
                                                                            </g:each>
                                                                        %{-- A2 master --}%
                                                                            <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].parentGroups[k].chartMasters[n]}"
                                                                                    var="chartMaster">
                                                                                <li>
                                                                                    <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                                    <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                                </li>
                                                                            </g:each>
                                                                        </ul>
                                                                    </li>
                                                                </g:each>
                                                            %{-- A1 master --}%
                                                                <g:each in="${chartClassLists.chartGroups[i].parentGroups[j].chartMasters[k]}"
                                                                        var="chartMaster">
                                                                    <li>
                                                                        <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster?.accountName}</a>
                                                                        <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master" class="inline"><span class="glyphicon glyphicon-zoom-in"></span></a>
                                                                    </li>
                                                                </g:each>
                                                            </ul>
                                                        </li>

                                                    </g:each>
                                                %{-- A master --}%
                                                    <g:each in="${chartClassLists.chartGroups[i].chartMasters[j]}"
                                                            var="chartMaster">
                                                        <li>
                                                            <a href="${createLink(controller: 'chartMaster', action: 'edit')}" class="chart" id="${chartMaster.id}">${chartMaster.accountName}</a>
                                                            <a href="${createLink(controller: 'chartMaster', action: 'view')}" class="chart" id="${chartMaster.id}" title="View Master"><span class="glyphicon glyphicon-zoom-in"></span></a>

                                                        </li>
                                                    </g:each>
                                                </ul>
                                            </li>
                                        </g:if>
                                    </g:each>
                                </ul>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
%{-- Tree View --}%
<link rel="stylesheet" href="${resource(dir: 'css/tree', file: 'jquery.treeview.css')}"/>
<link rel="stylesheet" href="${resource(dir: 'css/tree2', file: 'style.css')}"/>
<script>
    $(function () {
        $("li a").tooltip({placement: 'top'});
    });
</script>

%{--<script src="${resource(dir: 'js/tree', file: 'jquery.js')}" type="text/javascript"></script>--}%
<script src="${resource(dir: 'js/tree', file: 'jquery.cookie.js')}" type="text/javascript"></script>
<script src="${resource(dir: 'js/tree', file: 'jquery.treeview.js')}" type="text/javascript"></script>
<script type="text/javascript" src="${resource(dir: 'js/tree', file: 'demo.js')}"></script>
%{-- main tree viwe--}%


<script type="text/javascript">
    jQuery(function ($) {
        $('.chart').click(function(e) {
            var id = $(this).attr("id");
            var url = $(this).attr("href");
            jQuery.ajax({
                type: 'POST',
                url: url,
                data: {id: id},
                success: function (data, textStatus) {
                    $('#page-content').html(data);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //                    $('#'+updateDiv).html(data);
                }
            });
            e.preventDefault();
        });
    });

</script>
</body>
</html>