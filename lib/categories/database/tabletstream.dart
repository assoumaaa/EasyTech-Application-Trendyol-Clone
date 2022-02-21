import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:week6_starter/categories/model/tablets.dart';

class TabletService {

  final CollectionReference tabletCollection = FirebaseFirestore.instance.collection('Tablets');

  List<tablet> _tabletListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((doc){
      return tablet(
        tabletName: doc.get('Name') ?? '',
        manufacturer: doc.get('Manufacturer')?? '',
        image: doc.get('Image') ?? '',
        price: doc.get('Price') ?? '0',
        storage: doc.get('Storage') ?? '0',
        modelNumber: doc.get('Model Number') ?? '',
      );
    }).toList();
  }


  Stream<List<tablet>> get tablets {
    return tabletCollection.snapshots().map(_tabletListFromSnapshot);
  }
}
