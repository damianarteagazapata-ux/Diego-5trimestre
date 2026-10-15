void main async () {
  print('inicio del programa');
  try{
    String datos = await getAdd();
    print(datos);
  }catch(e){
    print(e);
  }
  print('fin del programa');
}
Future<String> getAdd(){
    return Future.delayed(Duration(seconds: 5), () {
        //simular una operacion asincrona que tarda 5 segundos en ejecutarse  
    int add = 0;
    for(int i = 0; i < 1000; i++){
        add += i;//acumulador 
    }

    return '$add';
    });
}
