<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core"
      xmlns:p="http://primefaces.org/ui">

<ui:composition template="/template.xhtml">


    <ui:define name="title">
        <h:outputText value="${r"#{"}bundle.List${pojo.name}Title${r"}"}"></h:outputText>
    </ui:define>

    <ui:define name="body">
        <h:form id="${pojo.name}ListForm">
            <p:panel header="${r"#{"}bundle.List${pojo.name}Title${r"}"}">
                <p:dataTable id="datalist" value="${r"#{"}${pojo.name?uncap_first}Controller.items${r"}"}" var="item"
                             selectionMode="single" selection="${r"#{"}${pojo.name?uncap_first}Controller.selected${r"}"}"
                             paginator="true"
                             rowKey="${r"#{"}item.id${r"}"}"
                             rows="10"
                             rowsPerPageTemplate="10,20,30,40,50"
                >

                    <p:ajax event="rowSelect"   update="createButton viewButton editButton deleteButton"/>
                    <p:ajax event="rowUnselect" update="createButton viewButton editButton deleteButton"/>
                    <#list pojo.fieldsSimple as fieldSimple>
                        <p:column>
                            <f:facet name="header">
                                <h:outputText value="${r"#{"}bundle.List${pojo.name}Title_${fieldSimple.name}${r"}"}"/>
                            </f:facet>
                            <h:outputText value="${r"#{"}item.${fieldSimple.name}${r"}"}"/>
                        </p:column>
                    </#list>
                    <#list pojo.fieldsGeneric as fieldGeneric>
                        <p:column>
                            <f:facet name="header">
                                <h:outputText value="${r"#{"}bundle.List${pojo.name}Title_${fieldGeneric.name}${r"}"}"/>
                            </f:facet>
                            <h:outputText value="${r"#{"}item.${fieldGeneric.name}${r"}"}"/>
                        </p:column>
                    </#list>
                    <f:facet name="footer">
                        <p:commandButton id="createButton" icon="ui-icon-plus"   value="${r"#{"}bundle.Create${r"}"}" actionListener="${r"#{"}${pojo.name?uncap_first}Controller.prepareCreate${r"}"}" update=":${pojo.name}CreateForm" oncomplete="PF('${pojo.name}CreateDialog').show()"/>
                        <p:commandButton id="viewButton"   icon="ui-icon-search" value="${r"#{"}bundle.View${r"}"}" update=":${pojo.name}ViewForm" oncomplete="PF('${pojo.name}ViewDialog').show()" disabled="${r"#{"}empty ${pojo.name?uncap_first}Controller.selected${r"}"}"/>
                        <p:commandButton id="editButton"   icon="ui-icon-pencil" value="${r"#{"}bundle.Edit${r"}"}" update=":${pojo.name}EditForm" oncomplete="PF('${pojo.name}EditDialog').show()" disabled="${r"#{"}empty ${pojo.name?uncap_first}Controller.selected${r"}"}"/>
                        <p:commandButton id="deleteButton" icon="ui-icon-trash"  value="${r"#{"}bundle.Delete${r"}"}" actionListener="${r"#{"}${pojo.name?uncap_first}Controller.destroy${r"}"}" update=":growl,datalist" disabled="${r"#{"}empty ${pojo.name?uncap_first}Controller.selected${r"}"}"/>
                    </f:facet>
                </p:dataTable>
            </p:panel>
        </h:form>

        <ui:include src="Create.xhtml"/>
        <ui:include src="Edit.xhtml"/>
        <ui:include src="View.xhtml"/>
    </ui:define>
</ui:composition>

</html>
