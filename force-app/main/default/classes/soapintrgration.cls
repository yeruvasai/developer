global class soapintrgration {
    
    webservice static id rec(string firstname , string lastname){
        contact con = new contact(lastname = lastname,firstname = firstname);
        insert con ;
        return con.id;
    }

}