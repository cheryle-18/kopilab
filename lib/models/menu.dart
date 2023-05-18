class Menu {
  int menuId;
  String name;
  String description;
  int price;
  String category;
  String imageUrl;
  String imageUrl2;

  Menu({
    required this.menuId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.imageUrl2,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuId: json["menuId"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        imageUrl: json["imageUrl"],
        imageUrl2: json["imageUrl2"],
      );
}

var menuList = [
  Menu(
      menuId: 1,
      name: 'Americano',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 20000,
      category: 'Coffee',
      imageUrl: 'assets/images/americano.png',
      imageUrl2:
          'https://d.wattpad.com/story_parts/669648024/images/15728562a963d376784608930121.jpg'),
  Menu(
      menuId: 2,
      name: 'Caramel Macchiato',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 30000,
      category: 'Coffee',
      imageUrl: 'assets/images/caramel-macchiato.png',
      imageUrl2:
          'https://www.wickedspatula.com/wp-content/uploads/2015/04/wickedspatula-paleo-iced-caramel-macchiato-1.jpg'),
  Menu(
      menuId: 3,
      name: 'Cappuccino',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 25000,
      category: 'Coffee',
      imageUrl: 'assets/images/cappuccino.png',
      imageUrl2:
          'https://coffeeaffection.com/wp-content/uploads/2021/02/does-a-cappuccino-have-caffeine.jpg'),
  Menu(
      menuId: 4,
      name: 'Dolce Latte',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 15000,
      category: 'Coffee',
      imageUrl: 'assets/images/dolce-latte.png',
      imageUrl2:
          'https://thegirlonbloor.com/wp-content/uploads/2018/08/Homemade-Cinnamon-Dolce-Latte-23.jpg'),
  Menu(
      menuId: 5,
      name: 'Classic Chocolate',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 30000,
      category: 'Non-Coffee',
      imageUrl: 'assets/images/classic-chocolate.png',
      imageUrl2:
          'https://kindlysweet.com/wp-content/uploads/2016/11/Iced-Chocolate.jpg'),
  Menu(
      menuId: 6,
      name: 'Strawberry Frappe',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 40000,
      category: 'Non-Coffee',
      imageUrl: 'assets/images/strawberry-frappe.png',
      imageUrl2:
          'https://milkandpop.com/wp-content/uploads/2021/01/strawberry-frappuccino-6-1024x683.jpg'),
  Menu(
      menuId: 7,
      name: 'Caramel Frappe',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 40000,
      category: 'Non-Coffee',
      imageUrl: 'assets/images/caramel-frappe.png',
      imageUrl2:
          'https://www.smalltownwoman.com/wp-content/uploads/2019/12/Caramel-Frappuccino-Facebook-Final-Recipe-Card.jpg'),
  Menu(
      menuId: 8,
      name: 'Matcha Frappe',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 35000,
      category: 'Non-Coffee',
      imageUrl: 'assets/images/matcha-frappe.png',
      imageUrl2:
          'https://www.modernfarmhouseeats.com/wp-content/uploads/2022/02/starbucks-iced-matcha-latte-1.jpg'),
  Menu(
      menuId: 9,
      name: 'Walnut Brownie',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 25000,
      category: 'Food',
      imageUrl: 'assets/images/walnut-brownie.png',
      imageUrl2:
          'https://5.imimg.com/data5/SELLER/Default/2020/12/NC/CB/SG/37207488/brownies-nr-18-57bb90b45f9b58cdfd70b045-500x500.jpg'),
  Menu(
      menuId: 10,
      name: 'Cinnamon Roll',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 25000,
      category: 'Food',
      imageUrl: 'assets/images/cinnamon-roll.png',
      imageUrl2:
          'https://www.allrecipes.com/thmb/VxNNFRBxh5G9osvtKw9J6T5PKsw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/9175447-d4cafe297e4746bfbe97e485ee057a0e.jpg'),
  Menu(
      menuId: 11,
      name: 'Butter Croissant',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 25000,
      category: 'Food',
      imageUrl: 'assets/images/butter-croissant.png',
      imageUrl2:
          'https://breadsandsweets.com/wp-content/uploads/2021/08/croissant-pic-4.jpg'),
  Menu(
      menuId: 12,
      name: 'Chocochip Cookie',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget rhoncus ultricies, nunc elit ultricies nunc, vitae luctus nisl nunc eu nunc.',
      price: 25000,
      category: 'Food',
      imageUrl: 'assets/images/chocochip-cookie.png',
      imageUrl2:
          'https://sallysbakingaddiction.com/wp-content/uploads/2013/05/classic-chocolate-chip-cookies.jpg'),
];
