({   
	doSave : function(component, event, helper) {
         var action = component.get("c.createcontact");
          
        var contactlistt = component.get("v.contactlistt");
        action.setParams({'contobj':component.get('v.contactobj')});
        action.setCallback(this,function(data){
            component.set('v.contactId',data.getReturnValue())
            contactlistt.splice(0,0,component.get('v.contactobj'));
            component.set("v.contactlistt",contactlistt)
            //displaying  the value of attribute as alert
            var tst1 = component.find('test');
            var tst2 = component.find('testt');
            alert('sucessfully inserted '+tst1.get('v.value')+' '+tst2.get('v.value'));
                
        });
        $A.enqueueAction(action);
                               
	},
    showcontacts: function(component, event, helper) {
        /*involking the method from apex class using get*/
         var action = component.get("c.retriveContacts"); 
       action.setCallback(this,function(data){
            component.set('v.contactlistt',data.getReturnValue()) /*setting the return value to the
            contactlist */
        });
        $A.enqueueAction(action);
    },
    
 })