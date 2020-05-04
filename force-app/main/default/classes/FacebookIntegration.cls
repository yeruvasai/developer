public class FacebookIntegration {

    public string facdata{get;set;}

    public FacebookIntegration() {
        
        http h = new http();
        HttpRequest Req = new HttpRequest();
        Req.setEndPoint('https://graph.facebook.com/2731267870319719?fields=id,name,website,posts&access_token=EAACVZCN2RdoYBAEzbFmnCZBWRHUxXjQkSXjKUiwfrexjoGlhvVIwdVXmrzdZCsuJfO45HzEmlzbjehy1HSNXYOLsTzZBIZAaEVdzd70RipJaqxWz7S9PsOuBO7Rddjlv8bgqncNXWo7ZCKLDzOUBU3xZANlz0vnNpZCyXQOYKmBJUksxCRs8TxBtyDQ4y8taisCQic7ka76ohqxx9LFGkWH9pMozNXVQzLjmPdwQc65nAgZDZD');
        Req.setMethod('GET');
        HttpResponse Res = h.send(req);
        facdata = Res.getBody();
        
        
    }

}