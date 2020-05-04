({
	submit : function(component, event, helper) {
        
        var rec = component.get("v.register");
        var action = component.get("c.recins");
        action.setParams({reg:rec});
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                alert('SUCCESS');
            }else{
                alert('FAILED')
            }
            
        });
		$A.enqueueAction(action);
	},
     init : function(component, event, helper) {
     component.set('v.regcolumn', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
         	{label:'Parent Name' ,fieldName: 'Parent_Name__c' , type:'text'},
         	{label: 'Class', fieldName: 'Class_Name__c', type: 'text'},
         	{label: 'Mobile Number', fieldName: 'Mobile_Number__c', type: 'phone'},
         	{label: 'Email', fieldName: 'Email__c', type: 'email'},
            
        ]);
        
         var action = component.get("c.regfetch");
        action.setParams({
            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
        $A.get('e.force:refreshView').fire();
            }
        });
        $A.enqueueAction(action);
     },
       updateSelectedText:function(component,event,helper){
        
        var chec = event.getParam("selectedRows");
                component.set("v.temp",chec);
         console.log(component.get("v.temp"));
         component.set("v.records",chec[0])
    	console.log(component.get("v.records"));
         
    },
    mail:function(component,event,helper){
        
        var body = component.get("v.subject");
        var addr = component.get("v.address");
        var mail = component.get("v.records").Email__c;
        console.log(body);
        console.log(addr);
        console.log(mail);
        var action = component.get("c.mailsend");
        action.setParams({mails:mail,subject:body,body:addr});
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                alert('SUCCESS');
            }else{
                alert('FAILED');
            }
        });
        $A.enqueueAction(action);
    },
    
    deletes:function(component,event,helper){
        
        var temp = component.get("v.temp");
    	var ids =[];
    	temp.forEach(deletefunc);
    function deletefunc(item){
    ids.push(item.Id);
    console.log(item.Id);
 		}
        var action = component.get("c.delrec");
        action.setParams({
            del : ids
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
                
            }
        });
        $A.enqueueAction(action);        
        
    },
    save:function(component,event,helper){
        var rec = component.get("v.records");
        console.log(rec);
        var action = component.get("c.uptrec");
        action.setParams({reg:rec});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                alert('SUCCESS');
            }else{
                alert('FAILED');
            }
        });
        $A.enqueueAction(action);
    }
    
})