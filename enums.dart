enum ProductType { pdf, excel, text,world}

enum Product {

pdf(productType :ProductType.pdf,productPrice:150,logo:"pdf-logo"),
excel(productType :ProductType.excel,productPrice:160,logo:"exc-logo"), 
text(productType :ProductType.text,productPrice:155,logo:"txt-logo"),
world(productType :ProductType.world,productPrice:171,logo:"wrd-logo");



const Product(
  {
  required  this.logo ,
  required this.productPrice, 
  required this.productType  
  }

); 


final ProductType productType ;
final double productPrice; 
final String logo; 


bool get isPdf => productType == ProductType.pdf;

}

void main()
{
  final type = Product.pdf; 

  if(type.isPdf) 
    print('pdf type ');
}