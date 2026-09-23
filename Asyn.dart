// Excercice 01: 

Future<int> getUserId() async {
  throw StateError('user not found');
}

Future<String> getusername(int userId) async {
  return  "khalil998"; 
}

Future<List<String>> getUserPermissions(int userId) async{
  return ["order:read","order:create"];
}


Future<String?> buildUserSummary() async{
var returnedValue = null;
try {
    final userId =await getUserId();
    final result =await Future.wait([getusername(userId),getUserPermissions(userId)]);
returnedValue = '- userId: $userId\n- UserName:${result[0]}\n- Permissions:${result[1]}';
} on StateError catch(e){
  print("${e.message}");

}finally{
  return returnedValue;
}

}

