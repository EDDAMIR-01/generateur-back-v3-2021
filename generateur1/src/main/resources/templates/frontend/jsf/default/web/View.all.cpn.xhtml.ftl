<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core"
      xmlns:p="http://primefaces.org/ui">

<ui:composition>

    <p:dialog id="${pojo.name}ViewDlg" widgetVar="${pojo.name}ViewDialog" modal="true" resizable="false" appendTo="@(body)" header="${r"#{"}bundle.View${pojo.name}Title${r"}"}">
        <h:form id="${pojo.name}ViewForm">
            <h:panelGroup id="display">
                <p:panelGrid columns="2" rendered="${r"#{"}${pojo.name}Controller.selected != null${r"}"}">
                    <#list pojo.fieldsSimple as fieldSimple>
                        <#if fieldSimple.type.simpleName != "Date">
                    <h:outputText value="${r"#{"}bundle.View${pojo.name}Label_${fieldSimple.name}${r"}"}"/>
                    <h:outputText value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldSimple.name}${r"}"}" title="${r"#{"}bundle.View${pojo.name}Title_${fieldSimple.name}${r"}"}"/>
                            <#else>
                    <h:outputText value="${r"#{"}bundle.View${pojo.name}Label_${fieldSimple.name}${r"}"}"/>
                    <h:outputText value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldSimple.name}${r"}"}" title="${r"#{"}bundle.View${pojo.name}Title_${fieldSimple.name}${r"}"}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                     </h:outputText>
                        </#if>
                    </#list>
                    <#list pojo.fieldsGeneric as fieldGeneric>
                    <h:outputText value="${r"#{"}bundle.View${pojo.name}Label_${fieldGeneric.name}${r"}"}"/>
                    <h:outputText value="${r"#{"}${pojo.name?uncap_first}Controller.selected.${fieldGeneric.name}${r"}"}" title="${r"#{"}bundle.View${pojo.name}Title_${fieldGeneric.name}${r"}"}"/>
                    </#list>
                </p:panelGrid>
                <p:commandButton value="${r"#{"}bundle.Close${r"}"}" onclick="${pojo.name}ViewDialog.hide()"/>
            </h:panelGroup>
        </h:form>
    </p:dialog>

</ui:composition>
</html>
