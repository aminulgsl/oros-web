<r:script>
        jQuery(document).ready(function(){
            jQuery("#grid").jqGrid({
                url:'${createLink(controller: 'demo', action: 'jqGridList')}',
                datatype: "json",
                mtype: 'GET',
                height: 'auto',
                autowidth: 750,
                scrollerbar:false,
                colNames:['First Name', 'Last Name', 'Address'],
                colModel:[
                    {name:'firstName',index:'', width:150, sortable:true, editable:false, fixed:true},
                    {name:'lastName',index:'', width:150,editable:false,sortable:false},
                    {name:'address',index:'', width:250,editable:false,sortable:false}
                ],
                jsonReader : {
                    repeatitems:false
                },
                loadonce: true,
                align: 'center',
                rowNum:5,
                rowList:[5,10,15],
                pager :'#pager',
                sortname: 'firstName',
                sortorder: "desc",
                sortableRows:true,
                caption: "jqGrid Test Data",
                viewrecords: true,
                	loadComplete : function() {
						var table = this;
						setTimeout(function()
						{
							updatePagerIcons(table);
						}, 0);
					}

            }).navGrid('#pager',{
            	        edit: false,
						del: false,
						search: false,
						searchicon : 'icon-search orange',
						refresh: true,
						refreshicon : 'icon-refresh green',
						gridview: true,
						autoencode: true
            });

        });

        function updatePagerIcons(table) {
            var replacement =
            {
                'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
                'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
                'ui-icon-seek-next' : 'icon-angle-right bigger-140',
                'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
            };
            $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
                var icon = $(this);
                var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

                if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
            })
        }
</r:script>