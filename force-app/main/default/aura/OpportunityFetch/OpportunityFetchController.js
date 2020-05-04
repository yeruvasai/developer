({
	dosearch : function(component,event){
        component.set('v.acccolumn',[
        
            {label:'opportunity name',fieldName:'Name',type:'text'},
        ]);
        
        var sear = component.get("v.search");
        
        var action = component.get("c.greater");
        
        action.setParams({
        gre : sear
        });
        action.setCallback(this,function(response){
        
            var state = response.getState();
            if(state == "SUCCESS"){
            
                var  values = response.getReturnValue();
                console.log(values);
                component.set("v.opportunity",values);
            
            }
        
        });
        $A.enqueueAction(action);
    
    },
    
    dosearch1 : function(component,event){
        component.set('v.acccolumn',[
        
            {label:'opportunity name',fieldName:'Name',type:'text'}
        ]);
        
        var sear = component.get("v.search");
        
        var action = component.get("c.less");
        
        action.setParams({
        les: sear
        });
        action.setCallback(this,function(response){
        
            var state = response.getState();
            if(state == "SUCCESS"){
            
                var  values = response.getReturnValue();
                component.set("v.opportunity",values);
            
            }
        
        });
        $A.enqueueAction(action);
    
    },
    
    dosearch2 : function(component,event){
        component.set('v.acccolumn',[
        
            {label:'opportunity name',fieldName:'Name',type:'text'}
        ]);
        
        var sear = component.get("v.search");
        
        var action = component.get("c.equal");
        
        action.setParams({
        equ: sear
        });
        action.setCallback(this,function(response){
        
            var state = response.getState();
            if(state == "SUCCESS"){
            
                var  values = response.getReturnValue();
                component.set("v.opportunity",values);
            
            }
        
        });
        $A.enqueueAction(action);
    
    },
    
})