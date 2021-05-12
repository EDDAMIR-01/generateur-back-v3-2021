<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<h:head>
    <title>Facelet Title</title>
    <h:outputStylesheet name="css/jsfcrud.css"/>
</h:head>
<h:body>
    Hello from Facelets
    <br />
    <h:link outcome="welcomePrimefaces" value="Primefaces welcome page" />
    <#list pojos as pojo>
        <br />
        <h:link outcome="/${pojo.name?uncap_first}/List" value="Show All ${pojo.name} Items"/>
    </#list>
</h:body>



</html>

