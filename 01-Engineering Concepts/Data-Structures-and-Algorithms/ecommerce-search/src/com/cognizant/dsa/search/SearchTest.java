package com.cognizant.dsa.search;

public class SearchTest {

    public static void main(String[] args) {

        Product[] products = {

                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Phone", "Electronics"),
                new Product(103, "Headphones", "Accessories"),
                new Product(104, "Shoes", "Fashion"),
                new Product(105, "Watch", "Fashion")

        };

        int target = 104;

        System.out.println("Linear Search");

        Product linearResult = SearchAlgorithms.linearSearch(products, target);

        System.out.println(linearResult);

        System.out.println();

        System.out.println("Binary Search");

        Product binaryResult = SearchAlgorithms.binarySearch(products, target);

        System.out.println(binaryResult);

    }

}