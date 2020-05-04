public class DynamicCustomizableListHandler {

    // Resources we need to hold on to across requests
    private ApexPages.StandardSetController controller;
    private PageReference savePage;

    // This is the state for the list "app"
    private Set<String> unSelectedNames = new Set<String>();
    private Set<String> selectedNames = new Set<String>();
    private Set<String> inaccessibleNames = new Set<String>();

    public DynamicCustomizableListHandler(ApexPages.StandardSetController controller) {
        this.controller = controller;
        loadFieldsWithVisibility();
    }

    // Initial load of the fields lists
    private void loadFieldsWithVisibility() {
        Map<String, Schema.SobjectField> fields = 
            Schema.SobjectType.Account.fields.getMap();
        for (String s : fields.keySet()) {
            if (s != 'Name') {  // name is always displayed 
                unSelectedNames.add(s);
            }
            if (!fields.get(s).getDescribe().isAccessible()) {
                inaccessibleNames.add(s);
            }
        }
    }

    // The fields to show in the list
    // This is what we generate the dynamic references from
    public List<String> getDisplayFields() { 
        List<String> displayFields = new List<String>(selectedNames);
        displayFields.sort();
        return displayFields;
    }
    


    // Nav: return to list view
    public PageReference show() {
        // This forces a re-query with the new fields list
        controller.reset();
        controller.addFields(getDisplayFields());
        return savePage; 
    }

    // Create the select options for the two select lists on the page
    public List<SelectOption> getSelectedOptions() { 
        return selectOptionsFromSet(selectedNames);
    }
    public List<SelectOption> getUnSelectedOptions() { 
        return selectOptionsFromSet(unSelectedNames);
    }
    
    private List<SelectOption> selectOptionsFromSet(Set<String> opts) {
        List<String> optionsList = new List<String>(opts);
        optionsList.sort();
        List<SelectOption> options = new List<SelectOption>();
        for (String s : optionsList) {
            options.add(new 
                SelectOption(s, decorateName(s), inaccessibleNames.contains(s)));
        }
        return options;
    }

    private String decorateName(String s) {
        return inaccessibleNames.contains(s) ? '*' + s : s;
    }  
   
}