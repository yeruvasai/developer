({
	init : function(component, event, helper) {
		
        var a = component.get('c.dynamic');
        
        a.setCallback(this,function(response){
            
            var state = response.getState();
            if(state == "SUCCESS"){
                component.set('v.sobjectpicklist',response.getReturnValue());
            }
            else{
                alert('error');
            }
            
        });
        $A.enqueueAction(a);
	},
    
    changefeilds : function(component, event, helper) {
        
        var a = component.get('v.selectValue');
        var action = component.get('c.selectobj');
        
        action.setParams({
           sel : a
           });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var values = response.getReturnValue();
                var plValues = [];
                
                for (var i = 0; i < values.length; i++) {
                    plValues.push({
                        label: values[i],
                        value: values[i]
                    });
                }
                component.set('v.GenreList',plValues);
                
            }
            
        });
        $A.enqueueAction(action);
    },
    
    handleGenreChange:function(component, event, helper) {
        	var objs = component.get('v.selectValue');
        console.log(objs);
        	var obj1 = event.getParam("value");
        console.log(obj1);
        var st = [];
        for(var i=0;i<obj1.length;i++){
            st.push(obj1[i]);
        }
        var action = component.get("c.selectfie");
        action.setParams({
            obj:objs,fie:st
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var values = response.getReturnValue();
                var plValues = [];
                
                for (var i = 0; i < values.length; i++) {
                    plValues.push({
                        label: values[i],
                        value: values[i]
                    });
                }
                component.set("v.selectedGenreList",plValues);
                console.log(plValues);
            }
        });
        $A.enqueueAction(action);
    } ,
    addRow : function(component, event, helper) {
		var details = component.get("v.selectedGenreList");
        var cursize = parseInt((details.length));
        var newsize = parseInt((cursize)+1);
        details.push(newsize);
        component.set("v.selectedGenreList",details);
	},
    
})