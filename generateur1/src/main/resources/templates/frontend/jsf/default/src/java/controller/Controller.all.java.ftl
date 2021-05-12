package controller;

import bean.${pojo.name};
import controller.util.JsfUtil;
import controller.util.JsfUtil.PersistAction;
import service.${pojo.name}Facade;

import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@Named("${pojo.name?uncap_first}Controller")
@SessionScoped
public class ${pojo.name}Controller implements Serializable {

@EJB
private service.${pojo.name}Facade ejbFacade;
private List<${pojo.name}> items = null;
    private ${pojo.name} selected;

    public ${pojo.name}Controller() {
    }

    public ${pojo.name} getSelected() {
    return selected;
    }

    public void setSelected(${pojo.name} selected) {
    this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private ${pojo.name}Facade getFacade() {
    return ejbFacade;
    }

    public ${pojo.name} prepareCreate() {
    selected = new ${pojo.name}();
    initializeEmbeddableKey();
    return selected;
    }

    public void create() {
    persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("${pojo.name}Created"));
    if (!JsfUtil.isValidationFailed()) {
    items = null;    // Invalidate list of items to trigger re-query.
    }
    }

    public void update() {
    persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("${pojo.name}Updated"));
    }

    public void destroy() {
    persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("${pojo.name}Deleted"));
    if (!JsfUtil.isValidationFailed()) {
    selected = null; // Remove selection
    items = null;    // Invalidate list of items to trigger re-query.
    }
    }

    public List<${pojo.name}> getItems() {
        if (items == null) {
        items = getFacade().findAll();
        }
        return items;
        }

        private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
        setEmbeddableKeys();
        try {
        if (persistAction != PersistAction.DELETE) {
        getFacade().edit(selected);
        } else {
        getFacade().remove(selected);
        }
        JsfUtil.addSuccessMessage(successMessage);
        } catch (EJBException ex) {
        String msg = "";
        Throwable cause = ex.getCause();
        if (cause != null) {
        msg = cause.getLocalizedMessage();
        }
        if (msg.length() > 0) {
        JsfUtil.addErrorMessage(msg);
        } else {
        JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
        } catch (Exception ex) {
        Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
        }
        }
        }

        public ${pojo.name} get${pojo.name}(java.lang.Long id) {
        return getFacade().find(id);
        }

        public List<${pojo.name}> getItemsAvailableSelectMany() {
            return getFacade().findAll();
            }

            public List<${pojo.name}> getItemsAvailableSelectOne() {
                return getFacade().findAll();
                }

                @FacesConverter(forClass = ${pojo.name}.class)
                public static class ${pojo.name}ControllerConverter implements Converter {

                @Override
                public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
                if (value == null || value.length() == 0) {
                return null;
                }
                ${pojo.name}Controller controller = (${pojo.name}Controller) facesContext.getApplication().getELResolver().
                getValue(facesContext.getELContext(), null, "${pojo.name?uncap_first}Controller");
                return controller.get${pojo.name}(getKey(value));
                }

                java.lang.Long getKey(String value) {
                java.lang.Long key;
                key = Long.valueOf(value);
                return key;
                }

                String getStringKey(java.lang.Long value) {
                StringBuilder sb = new StringBuilder();
                sb.append(value);
                return sb.toString();
                }

                @Override
                public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
                if (object == null) {
                return null;
                }
                if (object instanceof ${pojo.name}) {
                ${pojo.name} o = (${pojo.name}) object;
                return getStringKey(o.getId());
                } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), ${pojo.name}.class.getName()});
                return null;
                }
                }

                }

                }
