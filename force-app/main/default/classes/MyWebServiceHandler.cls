global class MyWebServiceHandler {

    webservice static id createAccount(string firstName,string lastName){
        contact c = new contact();
        c.LastName = lastName;
        c.FirstName = firstName;
        insert c;
        return c.Id;
    }
    
}