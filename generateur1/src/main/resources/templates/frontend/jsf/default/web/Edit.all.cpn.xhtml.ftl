<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core"
      xmlns:p="http://primefaces.org/ui">

<ui:composition>
    <p:dialog id="${pojo.name}EditDlg" widgetVar="${pojo.name}EditDialog" modal="true" resizable="false" appendTo="@(body)" header="${r"#{"}$bundle.Edit${pojo.name}Title${r"}"}">
        <h:form id="${pojo.name}EditForm">
            <h:panelGroup id="display">
            <p:panelGrid columns="2" rendered="${r"#{"}${pojo.name?uncap_first}Controller.selected != null${r"}"}">
                <#list pojo.fieldsSimple as fieldSimple>
                    <#if fieldSimple.type.simpleName != "Date">
                    <p:outputLabel value="${r"#{"}bundle.Edit${pojo.name}Label_${fieldSimple.name}${r"}"}" for="${fieldSimple.name}" />
                    <p:inputText id="${fieldSimple.name}" value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldSimple.name}${r"}"}" title="${r"#{"}bundle.Edit${pojo.name}Title_${fieldSimple.name}${r"}"}" />
                    <#else>
                    <p:outputLabel value="${r"#{"}bundle.Edit${pojo.name}Label_${fieldSimple.name}${r"}"}" for="${fieldSimple.name}" />
                    <p:calendar id="${fieldSimple.name}" pattern="MM/dd/yyyy" value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldSimple.name}${r"}"}" title="${r"#{"}bundle.Edit${pojo.name}Title_${fieldSimple.name}${r"}"}"  showOn="button"/>
                    </#if>
                </#list>
                <#list pojo.fieldsGeneric as fieldGeneric>
                    <p:outputLabel value="${r"#{"}bundle.Edit${pojo.name}Label_${fieldGeneric.name}${r"}"}" for="${fieldGeneric.name}" />
                    <p:selectOneMenu id="${fieldGeneric.name}" value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldGeneric.name}${r"}"}" >
                        <f:selectItem itemLabel="${r"#{"}bundle.SelectOneMessage${r"}"}"/>
                        <f:selectItems value="${r"#{"}${fieldGeneric.name}Controller.itemsAvailableSelectOne${r"}"}"
                                       var="${fieldGeneric.name}Item"
                                       itemValue="${r"#{"}${fieldGeneric.name}Item${r"}"}"/>
                    </p:selectOneMenu>
                </#list>
            </p:panelGrid>
                <p:commandButton actionListener="${r"#{"}${pojo.name?uncap_first}Controller.update${r"}"}" value="${r"#{"}bundle.Save${r"}"}" update="display,:${pojo.name}ListForm:datalist,:growl" oncomplete="handleSubmit(args, '${pojo.name}EditDialog');"/>
                <p:commandButton value="${r"#{"}bundle.Cancel${r"}"}" onclick="${pojo.name}EditDialog.hide()"/>
            </h:panelGroup>
        </h:form>
    </p:dialog>

</ui:composition>
</html>
