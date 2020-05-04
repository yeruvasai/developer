({
	createObjectData: function(component, event) {
        // get the offerList from component and add(push) New Object to List
        var recordId = component.get("v.recordId");
        console.log('recordId' + recordId);
        
        var RowItemList = component.get("v.OfferList");
        RowItemList.push({
            'sobjectType': 'nu_dse__Offer__c',
            'nu_dse__Offer_Type__c': '',
            'nu_dse__Offer_Amount__c': '',
            '% of Current Balance': '',
            '% of Verified Balance':'',
            'Accepted':''
        });
        console.log('offerdata' +RowItemList);
        // set the updated list to attribute (offerList) again    
        component.set("v.OfferList", RowItemList);
    }
})