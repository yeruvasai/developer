({
	doInit : function(component, event, helper) {
        var url = $A.get('$Resource.einstein');
        component.set('v.backgroundImageURL', url);
    },
    doInit1 : function(component, event, helper) {
        var url = $A.get('$Resource.Hardly');
        component.set('v.backgroundImageURL1', url);
    }
    
    
})