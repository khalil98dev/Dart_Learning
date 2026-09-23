import 'dart:async';
void streamhandler<T>(Stream<T> stream){
  stream.listen((value){
    print(value);
  });
}

Future<void> counter(StreamController<int> controller) async{

    await  Future.delayed(Duration(milliseconds:500));
    controller.add(1);

    await  Future.delayed(Duration(milliseconds:500));
    controller.add(2);

    await  Future.delayed(Duration(milliseconds:500));
    controller.add(3);

    await  Future.delayed(Duration(milliseconds:500));
    controller.add(4);

    await  Future.delayed(Duration(milliseconds:500));
    controller.add(5);

    await controller.close();
}


void main() async{

  final controller = StreamController<int>();
  streamhandler(controller.stream);
  await counter(controller);

}