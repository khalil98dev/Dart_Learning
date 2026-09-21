class ApiService {
  late String BaseUrl ; 

    ApiService(url){
      this.BaseUrl = url;
    }

  void initialize(){
    BaseUrl = "https://localhost:7031/api/";
  }

  void printUrl() {
    print(BaseUrl);
  }

}


void main(){
  final user = User(); 

  user.InitializeDefault();  
  print(user.name) ; 
  print(user.email); 
}






class User{
  late String name ; 
  late String email ; 

  void initialize(name,email){
    name =name; 
    email=email;
  }

  void InitializeDefault(){
    name="default"; 
    email="default@default.com";
  }

}


