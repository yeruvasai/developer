public class Piechart {
    
    public list<chartwrapper> getrecords(){
        list<chartwrapper> chart = new list<chartwrapper>();
        chart.add(new chartwrapper('Benelli',15));
        chart.add(new chartwrapper('Hero',3));
        chart.add(new chartwrapper('Ducati',20));
        chart.add(new chartwrapper('BMW',15));
        chart.add(new chartwrapper('Honda',40));
        chart.add(new chartwrapper('Harley Davidson',7));

        return chart;
    }
    
    
    public class chartwrapper{
        
        public string bikename{get; set;}
        public integer price{get; set;}
        
        public chartwrapper(string bikename,integer price){
            this.bikename = bikename;
            this.price = price;
        }
        
    }

}