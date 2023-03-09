
import 'package:database/app/data/entity_student.dart' show entity_student;
import 'package:database/objectbox.g.dart' show Query, entity_student_, openStore;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;



class databaseserver{
  static late var store;
  static Future<void>initilizedb()async{
    final docsdir=await getApplicationDocumentsDirectory();
    store=await openStore(directory: '${docsdir.path}/sampledatabase2');}
  insertupdateemployee({required entity_student model}){
    store.box<entity_student>().put(model);
  }
  deleteEmployee({required int rowid}){
    store.box<entity_student>().remove(rowid);
  
  }
  List<entity_student>getallemployee(){
    return store.box<entity_student>().getAll();
  }
  List<entity_student> search({  required String searchkey}) {
    
    Query<entity_student> query = store
    .box<entity_student>()
    .query(entity_student_.name.contains(searchkey))
    .build();
    print(query);
    return query.find();
  }  
  
  
}