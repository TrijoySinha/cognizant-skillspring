package com.cognizant.designpatterns.singleton;

public class SingletonTest {

    public static void main(String[] args) {
        
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("Application Started");
        logger2.log("User Logged In");

        System.out.println();

        
        System.out.println("Logger 1 HashCode : " + logger1.hashCode());
        System.out.println("Logger 2 HashCode : " + logger2.hashCode());

        System.out.println();

        System.out.println("Are both objects the same? " + (logger1 == logger2));
    }

}
