import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:get/get.dart';

import '../../view/category_view_model.dart';

class HomeController extends GetxController {
  RxList<ProductViewModel> products = RxList([]);

  void initProduct() {
    products.value = [
      ProductViewModel(
        title: "Wireless Headphones",
        company: "Sony",
        imageUrl: ["assets/products/headphones.jpeg", ],
        marks: ["Best Seller", "Trending"],
        price: 299,
        sale: 10,
        description: "High-quality wireless noise-cancelling headphones with long battery life.",
        specification: [
          Specification(title: "Bluetooth", value: "5.0"),
          Specification(title: "Noise Cancelling", value: "Yes"),
          Specification(title: "Battery Life", value: "30 Hours"),
          Specification(title: "Microphone", value: "Built-in"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Headphones", "Audio Devices"],
          ),
          CategoryViewModel(
            title: "Accessories",
            subCategory: ["Wireless", "Gadgets"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Smartphone",
        company: "Samsung",
        imageUrl: ["assets/products/samsung-phone.jpeg"],
        marks: ["New Arrival", "Featured"],
        price: 999,
        sale: 20,
        description: "Flagship smartphone with high-end specs and camera.",
        specification: [
          Specification(title: "Display", value: "6.8-inch"),
          Specification(title: "Processor", value: "Snapdragon"),
          Specification(title: "Camera", value: "108MP"),
          Specification(title: "Battery", value: "5000mAh"),
        ],
        category: [
          CategoryViewModel(
            title: "Mobile Phones",
            subCategory: ["Android", "Flagship"],
          ),
          CategoryViewModel(
            title: "Gadgets",
            subCategory: ["Smartphones"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Gaming Laptop",
        company: "Asus",
        imageUrl: ["assets/products/gaming-laptop.jpg"],
        marks: ["Top Rated", "Performance"],
        price: 1899,
        sale: 0,
        description: "High-performance gaming laptop with dedicated graphics.",
        specification: [
          Specification(title: "Processor", value: "Intel i9"),
          Specification(title: "RAM", value: "16GB"),
          Specification(title: "Storage", value: "1TB SSD"),
          Specification(title: "Graphics", value: "NVIDIA RTX 4080"),
        ],
        category: [
          CategoryViewModel(
            title: "Computers",
            subCategory: ["Laptops", "Gaming"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Smartwatch",
        company: "Apple",
        imageUrl: ["assets/products/smartwatch.jpeg"],
        marks: ["Trending", "Best Seller"],
        price: 399,
        sale: 0,
        description: "Apple Watch with health tracking and GPS.",
        specification: [
          Specification(title: "Heart Rate Monitor", value: "Yes"),
          Specification(title: "GPS", value: "Built-in"),
          Specification(title: "Water Resistant", value: "Yes"),
          Specification(title: "Display", value: "OLED"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Wearables", "Smart Devices"],
          ),
          CategoryViewModel(
            title: "Fashion",
            subCategory: ["Accessories"],
          ),
        ],
      ),
      ProductViewModel(
        title: "4K TV",
        company: "LG",
        imageUrl: ["assets/products/4k-tv.jpg"],
        marks: ["New Arrival"],
        price: 1200,
        sale: 15,
        description: "Ultra HD 4K smart TV with HDR support.",
        specification: [
          Specification(title: "Screen Size", value: "65-inch"),
          Specification(title: "HDR", value: "HDR10+"),
          Specification(title: "Smart Features", value: "Yes"),
          Specification(title: "HDMI Ports", value: "4"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["TV & Video"],
          ),
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Entertainment"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Bluetooth Speaker",
        company: "JBL",
        imageUrl: ["assets/products/jbl.jpg"],
        marks: ["Popular", "Affordable"],
        price: 99,
        sale: 0,
        description: "Portable Bluetooth speaker with deep bass.",
        specification: [
          Specification(title: "Bluetooth Version", value: "5.1"),
          Specification(title: "Battery Life", value: "12 Hours"),
          Specification(title: "Waterproof", value: "Yes"),
          Specification(title: "Design", value: "Compact"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Audio Devices", "Speakers"],
          ),
          CategoryViewModel(
            title: "Accessories",
            subCategory: ["Portable Devices"],
          ),
        ],
      ),
      ProductViewModel(
        title: "DSLR Camera",
        company: "Canon",
        imageUrl: ["assets/products/camera.jpeg"],
        marks: ["Best Seller", "Professional"],
        price: 1500,
        sale: 30,
        description: "Professional DSLR camera for stunning photos.",
        specification: [
          Specification(title: "Resolution", value: "24.1MP APS-C"),
          Specification(title: "Processor", value: "DIGIC 8"),
          Specification(title: "Video", value: "4K Recording"),
          Specification(title: "Connectivity", value: "Wi-Fi"),
        ],
        category: [
          CategoryViewModel(
            title: "Electronics",
            subCategory: ["Cameras", "Photography"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Microwave Oven",
        company: "Panasonic",
        imageUrl: ["assets/products/microwave.jpg"],
        marks: ["Reliable", "Energy Efficient"],
        price: 250,
        sale: 0,
        description: "Compact microwave oven with multiple cooking modes.",
        specification: [
          Specification(title: "Power", value: "800W"),
          Specification(title: "Cooking Programs", value: "10"),
          Specification(title: "Child Lock", value: "Yes"),
          Specification(title: "Interior", value: "Easy Clean"),
        ],
        category: [
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Microwaves", "Kitchen"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Running Shoes",
        company: "Nike",
        imageUrl: ["assets/products/shoes.jpg"],
        marks: ["Top Rated", "Comfort"],
        price: 120,
        sale: 0,
        description: "Lightweight and comfortable running shoes.",
        specification: [
          Specification(title: "Material", value: "Breathable Mesh"),
          Specification(title: "Sole", value: "Cushioned"),
          Specification(title: "Outsole", value: "Rubber"),
          Specification(title: "Colors", value: "Multiple"),
        ],
        category: [
          CategoryViewModel(
            title: "Fashion",
            subCategory: ["Men", "Sportswear"],
          ),
        ],
      ),
      ProductViewModel(
        title: "Electric Kettle",
        company: "Philips",
        imageUrl: ["assets/products/electric-kettle.jpg"],
        marks: ["Energy Saver", "Popular"],
        price: 45,
        sale: 10,
        description: "Fast boiling electric kettle with auto shut-off.",
        specification: [
          Specification(title: "Capacity", value: "1.7L"),
          Specification(title: "Body", value: "Stainless Steel"),
          Specification(title: "Auto Shut-Off", value: "Yes"),
          Specification(title: "Design", value: "Cordless"),
        ],
        category: [
          CategoryViewModel(
            title: "Home Appliances",
            subCategory: ["Kitchen"],
          ),
        ],
      ),
    ];
  }
}
