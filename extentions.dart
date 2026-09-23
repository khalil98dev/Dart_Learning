

extension ToInt on String {
  int parseInt(){
    return int.parse(this); 
  }

  int koko(){
    return int.parse(this)+1; 
  }
}

void main(){

  String text = '14'; 

  print(text.parseInt()); 

  print(text.koko());    

  


}