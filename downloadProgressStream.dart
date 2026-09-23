import 'dart:async';
import 'dart:math';

Stream<int> downloadProgress() {
  final controller = StreamController<int>(); 

  for(int i = 10 ; i<=100;i+=10){
    
    final delay = (1+Random().nextInt(7))*100; 

    await Future.delayed(Duration(milliseconds: delay));
    
    controller.add(i);
  }

  await controller.close();

  return controller.stream;
}

void streamConsumer<T>(Stream<T> stream){
  stream.listen((value){
    print(value);
  });
}

void main()async{

  final stream = await downloadProgress();

  streamConsumer(stream);


}