class SpaceCraft{
  String name ; 
  DateTime? launchDate ; 

  int?  get launchYear  => launchDate?.year;


SpaceCraft(this.name,this.launchDate){

}

SpaceCraft.unlaunched(String name):this(name,null);


void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }

}

void main(){
  var voyager = SpaceCraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = SpaceCraft.unlaunched('Voyager III');
voyager3.describe();
}

