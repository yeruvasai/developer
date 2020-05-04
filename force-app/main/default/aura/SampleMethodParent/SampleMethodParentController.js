({
	 callAuraMethod : function(component, event, helper) {
            var childCmp = component.find("childComponent");
            var retnMsg = childCmp.GetMessageFromChildMethod('Prasad');
            component.set("v.message", retnMsg);
     }
})