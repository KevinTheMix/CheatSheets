// import 'dart:async'; // Required if we want to use FutureOr<T>.

void main() async {
  var future = Future(() => 'Future');  // Future<String>
  var value1 = Future.value(123);       // Future<int>
  var value2 = Future.value();          // Future<dynamic>, same
  var empty = Future(() {});            // Future<Null>
     
  print('First');
  
  print(await value1);
  print(await value2);
  print(await koko());  // Commenting out this statement somehow effects the order of execution of the two following futures.
    
  empty.then((_) => print('Empty'));  // The Future returns nothing, but then() always has a parameter - even if void.  
  future
    .then<String>((s) { print(s); throw 'Error'; }) // We need to indicate (generic) type here, so following on|catchError knows what to return!
    .onError<String>((error, stackTrace) { print(error); return 'Handled'; })
    .catchError((error) { print(error); return 'Caught'; })
    .then((s) { print('Finally: $s'); }
  );
  
  print('Last');
}

Future<String> koko() async {
  return Future(() => 'Koko');  // await is optional in return statements of async methods.
}