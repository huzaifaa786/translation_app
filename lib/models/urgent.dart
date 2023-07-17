class Urgent {
  String? day;
  String? minpage;
  String? maxpage;
 

  Urgent(urgent){
    day = urgent['day'];
    minpage = urgent['minpage'];
    maxpage = urgent['maxpage'];
    
  }
}