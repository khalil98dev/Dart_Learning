import 'dart:ffi';

enum PaymentSatus {
 Pending(Title:'Pending',Value:1 ), 
 Processing(Title: 'Processing',Value:  2), 
 Completed(Title:  'Completed',Value: 3), 
 Failed(Title:  'Failed',Value:  4);
const PaymentSatus({
  required this.Title, 
  required this.Value
});

final String Title ; 
final int Value ; 
}

enum PaymentMethod {
 Cash('Pending'), 
 Card('Processing'), 
 Wallet('Completed');
const PaymentMethod(this.Title);

final String Title ; 
 
}


abstract class Payementsystem {

  final PaymentMethod paymentMethod = PaymentMethod.Cash; 
  final PaymentSatus paymentStatus = PaymentSatus.Pending; 

  void Procced(); 

  void info();
}



class cashPayment