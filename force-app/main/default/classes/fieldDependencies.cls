public class fieldDependencies {

    public String cities { get; set; }

    public String city { get; set; }

    public List<SelectOption> getstates(){
    List<SelectOption> options=new List<SelectOption>();
    if(country=='US'){
        options.add(new SelectOption('CO','Colorado'));
        options.add(new SelectOption('NY','New York'));
        options.add(new SelectOption('CA','California'));
        options.add(new SelectOption('TX','Texas'));
        options.add(new SelectOption('WAS','Washington'));
    }
    if(country=='IN'){
        options.add(new SelectOption('AP','Andhra pradesh'));
        options.add(new SelectOption('TN','Telangana'));
        options.add(new SelectOption('KAT','Karnataka'));
        options.add(new SelectOption('KL','kerala'));
        options.add(new SelectOption('TAM','Tamilnadu'));
    }
    if(country=='AUS'){
        options.add(new SelectOption('SDY','Sydney'));
        options.add(new SelectOption('HO','Hobart'));
        options.add(new SelectOption('NSW','New South Wales'));
        options.add(new SelectOption('ML','Melbourne'));
        options.add(new SelectOption('PTH','Perth'));
    }
    if(country=='DUB'){
        options.add(new SelectOption('AD','Abu Dhabi'));
        options.add(new SelectOption('SJH','Sharjah'));
        
    }
    return options;

}
    public String state { get; set; }

    public List<SelectOption> getcountries(){
    List<SelectOption> options=new List<SelectOption>();
    options.add(new Selectoption('None','----Select----'));
    options.add(new Selectoption('US','United States'));
    options.add(new Selectoption('IN','India'));
    options.add(new Selectoption('AUS','Australia'));
    options.add(new Selectoption('DUB','Dubai'));
    return options;
}


    public String country { get; set; }
}