import 'dart:async';
import 'dart:math';

Stream<int> downloadProgress() {
  final controller = StreamController<int>(); 

produce(controller); 
return controller.stream;
}

void streamConsumer<T>(Stream<T> stream,
 Function? OnError,void Function() OnDone,bool CancelError){
  stream.listen((value){
    print(value);
  });
}

Future<void> produce(StreamController<int> controller) async 
{
  for(int i = 10 ; i<=100;i+=10){
    
    final delay = (1+Random().nextInt(7))*100; 

    await Future.delayed(Duration(milliseconds: delay));
    
    controller.add(i);
  }

  await controller.close();
}


void main()async{

  final stream = downloadProgress();

  late StreamSubscription sup ; 

   sup = stream.listen((data){
    print(data);
    
    if(data==50){
        print('Subscription cancelled');
        sup.cancel();  
    }

  });
}