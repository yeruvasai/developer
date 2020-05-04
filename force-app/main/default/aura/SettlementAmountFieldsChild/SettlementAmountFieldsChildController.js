({
	AddNewRow : function(component, event, helper){
       // fire the AddNewRowEvt Lightning Event 
        component.getEvent("AddRowEvt").fire();     
    },
     removeRow : function(component, event, helper){
     // fire the DeleteRowEvt Lightning Event and pass the deleted Row Index to Event parameter/attribute
       component.getEvent("DeleteRowEvt").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
    getPercentages : function(component, event, helper){
        var proposedAmount = component.find("comboBox").get("v.value");
        console.log('proposedAmount'+proposedAmount);
        var currentBal = (proposedAmount/500);
        console.log('currentBal'+currentBal);
        var verifiedBal = (proposedAmount/400);
        component.set("v.currentBal" ,currentBal);
        component.set("v.verifiedBal" ,verifiedBal);
        
    },
    onCheck  : function(component, event, helper){
        var checkCmp = component.find("checkbox").get("v.value");
        console.log('checkCmp'+checkCmp);
        if(checkCmp == true){
            console.log('In if true');
            var proposedAmount = component.find("comboBox").get("v.value");
            component.set("v.TotalOfferAmount" , proposedAmount);
        }
    }
})