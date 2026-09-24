import 'dart:ffi';

class Repository<T>{
  List<T> Items; 


  Repository(this.Items);

  int get Count => Items.length;


  void AddItem(T item){
    Items.add(item); 
  }

  void RemoveItem(T item){
    Items.remove(item); 
  }

  List<T> getAll() => Items; 


  T? find(bool Function(T item) predicate){
     try{
    return Items.firstWhere(predicate);
        }on StateError {
    return null;
      }
}

T? firstOrDefault<T>(List<T> items){
  return null;

}
}



class User {
  String userName ; 
  String Email; 
  String Password; 

  User(this.userName,this.Email,this.Password);
  

 @override
  String toString() {
    // TODO: implement toString
    return '- user name: $userName\n- Email: $Email';
  }


}

class Product {
  String name; 
  Float price; 
   
  Product(this.name,this.price);
}






void main(){
  List<User> users = <User>[];
  List<Product> products = <Product>[];
  var userRepository = Repository<User>(users); 

  var productRepository = Repository<Product>(products); 



   var newUser = new User('khalil98dev', "khalil98dev@gmail.com", "3");
     var newUser2 = new User('userName', "Email", "3");
       var newUser3 = new User('userName', "Email", "3");
         var newUser4 = new User('userName', "Email", "3");

  userRepository.AddItem(newUser);
    userRepository.AddItem(newUser2);
      userRepository.AddItem(newUser3);
        userRepository.AddItem(newUser4);

  
var result = userRepository.find((i)=>i.userName == "khalil98dev"); 

if(result== null) 
  print("not foun"); 
else 
    print(result.toString());


}