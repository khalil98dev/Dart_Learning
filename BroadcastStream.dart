import 'dart:async';
extension StreamControllerExtension<T> on StreamController<T> {
  StreamSubscription<T> subscribe(void Function(T) listener) {
    return stream.listen(listener);
  }
}


//Fake Adding Messages Beoadcase 

Future<void> Produce(StreamController<String> controller) async{
    controller.add("User logged in");
    
    await Future.delayed(Duration(milliseconds: 500));  
    controller.add("New order created");

    await Future.delayed(Duration(milliseconds: 1500));
    controller.add("Payment completed");

    await Future.delayed(Duration(milliseconds: 1200));
    controller.add("New notification");

    await controller.close();
}

void main() async{

  final controller = StreamController<String>.broadcast(); 

  late StreamSubscription<String> sup1,sup2,sup3; 




//Subscripers: 
sup1 = controller.subscribe((message){
    print("Subscriber 1 received: $message");
});

controller.add("User logged in");



sup2 = controller.subscribe((message){
    print("Subscriber 2 received: $message");
});
await Future.delayed(Duration(milliseconds: 500));  
controller.add("New order created");



sup3 = controller.subscribe((message){
    print("Subscriber 3 received: $message");
});

    await Future.delayed(Duration(milliseconds: 1500));
    controller.add("Payment completed");


await Future.delayed(Duration(milliseconds: 1200));
controller.add("New notification");

//await Produce(controller);

}