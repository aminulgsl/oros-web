<div class="sidebar" id="sidebar">
<script type="text/javascript">
    try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
</script>

<div class="sidebar-shortcuts" id="sidebar-shortcuts">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
        <button class="btn btn-success">
            <i class="icon-signal"></i>
        </button>

        <button class="btn btn-info">
            <i class="icon-pencil"></i>
        </button>

        <button class="btn btn-warning">
            <i class="icon-group"></i>
        </button>

        <button class="btn btn-danger">
            <i class="icon-cogs"></i>
        </button>
    </div>

    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
        <span class="btn btn-success"></span>

        <span class="btn btn-info"></span>

        <span class="btn btn-warning"></span>

        <span class="btn btn-danger"></span>
    </div>
</div><!-- #sidebar-shortcuts -->

<ul class="nav nav-list">
<g:each in="${session?.sessionMenu}" var="menuItem">
    <sec:access controller='${menuItem.controllerName}' action='${menuItem.actionName}'>
        <g:if test="${menuItem.hasSubMenu == true}">
            <li>
                <a href="#" class="dropdown-toggle">
                    <i class="${menuItem.iconClassName}"></i>
                    <span class="menu-text">${menuItem.menuText}</span>
                    <b class="arrow icon-angle-down"></b>
                </a>
                <ul class="submenu">
                    <g:each in="${menuItem?.subMenuItemList}" var="subMenuItem">
                        <sec:access controller='${subMenuItem.controllerName}' action='${subMenuItem.actionName}'>

                            <li>
                                <a href="${createLink(controller: subMenuItem.controllerName, action: subMenuItem.actionName)}"
                                   class="ajax-link" updatediv="page-content">
                                    <i class="icon-double-angle-right"></i>${subMenuItem.menuText}</a>
                            </li>
                        </sec:access>
                    </g:each>
                </ul>
            </li>
        </g:if>
        <g:else>
            <li>
                <a href="${createLink(controller: menuItem.controllerName, action: menuItem.actionName)}">
                    <i class="${menuItem.iconClassName}"></i><span class="menu-text">${menuItem.menuText}</span></a>
            </li>
        </g:else>
    </sec:access>
</g:each>

</ul><!-- /.nav-list -->

<div class="sidebar-collapse" id="sidebar-collapse">
    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
</div>

<r:script>
    try {
        ace.settings.check('sidebar', 'collapsed')
    } catch (e) {
    }
</r:script>
</div>