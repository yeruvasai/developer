public class YoutubeIntegration {
    
    public string searchText {get;set;}
    public YoutubeIntegration.items[] dat{get;set;}
      

    public string searchurl ='https://www.googleapis.com/youtube/v3/search';
    public string apikey = 'AIzaSyAsFBvpqBKv1r5Qbo7oV3HIxGXlR0eARZY';
    
    public void search(){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        string endpoint = searchurl + '?part=snippet' + '&maxResults=30' + '&type=video' + '&q=' + EncodingUtil.urlEncode(searchText, 'UTF-8') +
            '&key=' + apikey;
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        system.debug('Response'+res.getBody());
        response Resp = (response)JSON.deserialize(res.getBody(),YoutubeIntegration.response.class); 
        dat  = resp.items;
    }
    
    public class response{
        public  YoutubeIntegration.items[] items{get;set;}
        
    }
    
    public class items {
        public String kind {get;set;}
        public String etag {get;set;}
        public YoutubeIntegration.Id id {get;set;}
        public YoutubeIntegration.Snippet snippet {get;set;}
    }
    
    public class Id {
        public String kind { get; set; }
        public String videoId { get; set; }
    }
    
    public class snippet{
		public String title {get;set;}
        public String description {get;set;}        
    }

}