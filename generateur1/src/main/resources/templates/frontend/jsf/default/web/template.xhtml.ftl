<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:p="http://primefaces.org/ui">

<h:head>
    <title><ui:insert name="title">Default Title</ui:insert></title>
    <h:outputStylesheet library="css" name="jsfcrud.css"/>
    <h:outputScript library="js" name="jsfcrud.js"/>
</h:head>

<h:body>

    <p:growl id="growl" life="3000" />

    <p:layout fullPage="true">
        <p:layoutUnit position="north" size="65" header="${r"#{"}bundle.AppName${r"}"}">
            <h:form id="menuForm">
                <p:menubar>
                    <p:menuitem value="${r"#{"}bundle.Home${r"}"}" outcome="/index" icon="ui-icon-home"/>
                    <p:submenu label="${r"#{"}bundle.Maintenance${r"}"}">
                        <#list pojos as pojo>
                        <p:menuitem value="${pojo.name}" outcome="/${pojo.name?uncap_first}/List.xhtml" />
                        </#list>
                    </p:submenu>
                </p:menubar>
            </h:form>
        </p:layoutUnit>

        <p:layoutUnit position="south" size="60">
            <ui:insert name="footer"/>
        </p:layoutUnit>

        <p:layoutUnit position="center">
            <ui:insert name="body"/>
        </p:layoutUnit>

    </p:layout>

</h:body>

</html>
