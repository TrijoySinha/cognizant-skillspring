package com.cognizant.designpatterns.singleton;

public class Logger {
    
    // Single instance of Logger 
    private static Logger instance = new Logger();

    // Private Constructor
    private Logger() {

    }

    // Global access to single instance
    public static Logger getInstance() {
        return instance;
    }

    // Logging Method
    public void log(String message) {
        System.out.println("[LOG]" + message);
    }

}
