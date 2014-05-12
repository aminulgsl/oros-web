package com.gsl.uma.saas

/**
 * Created by aminul haque on 3/9/14.
 */
class MenuItem {
    String menuText;
    String controllerName;
    String actionName;
    boolean hasSubMenu;
    String iconClassName;
    List<SubMenuItem> subMenuItemList;

    String getIconClassName() {
        return iconClassName
    }

    void setIconClassName(String iconClassName) {
        this.iconClassName = iconClassName
    }


    String getControllerName() {
        return controllerName
    }

    void setControllerName(String controllerName) {
        this.controllerName = controllerName
    }

    String getActionName() {
        return actionName
    }

    void setActionName(String actionName) {
        this.actionName = actionName
    }

    boolean getHasSubMenu() {
        return hasSubMenu
    }

    void setHasSubMenu(boolean hasSubMenu) {
        this.hasSubMenu = hasSubMenu
    }

    List<SubMenuItem> getSubMenuItemList() {
        return subMenuItemList
    }

    void setSubMenuItemList(List<SubMenuItem> subMenuItemList) {
        this.subMenuItemList = subMenuItemList
    }

    String getMenuText() {
        return menuText
    }

    void setMenuText(String menuText) {
        this.menuText = menuText
    }
}
