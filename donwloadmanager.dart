import 'dart:io';

enum DownloadStatus {
  Pending(title:"Pending",value: 1), Completed(title:"Completed",value: 2),Downlaoding(title: 'Downlading', value: 3); 

  const DownloadStatus({
    required this.title ,
    required this.value
  });

 final String title ;  
 final int value;


}

enum logs{
  Information,Error,Warning,Debug
}


abstract class Downloadable {
  String name;
  DownloadStatus status = DownloadStatus.Pending;

  Downloadable(this.name);

  void download();

  void printInfo();
}

class Lecture extends Downloadable with DonwloadLog{

  Lecture(String name): super(name);
  
  void download(){
    logInformation(name, 'strat downloading ...'); 
    status = DownloadStatus.Downlaoding;
    printInfo();
    print("Donwloading lecture $name .... ");
    sleep(Duration(seconds: 10));
    printInfo(); 
    status = DownloadStatus.Completed;

    logInformation(name, 'Completed.'); 
    printInfo();

    
  }

  void printInfo(){
    print('lecture ! $name\nStatus: ${status.title}'); 
  }



}



mixin DonwloadLog{
  void log(logs log,String name,String message){
    print("[$log]: $name- $message "); 
  }

  void logInformation(name,message){
    log(logs.Information,name,message);
  }

void logError(name,message){
    log(logs.Information,name,message);
  }



}

void main()
{
  final lect1 = Lecture("Anatomy"); 

  lect1.download();
  lect1.printInfo();


  
}