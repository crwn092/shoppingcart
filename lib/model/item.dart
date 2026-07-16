class Item {
  //Attribute
  int id;
  String name;

  //constructor
  Item(this.id,this.name);

  //Getter
  int get itemID => id;
  String get itemName => name;

  //Override toString method
  @override
  String toString(){
    return "$id : $name";
  }
}