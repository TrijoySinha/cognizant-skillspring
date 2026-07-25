package com.cognizant.designpatterns.factory;

public class ExcelDocument implements Document {

    @Override
    public void open() {
        System.out.println("Opening Microsoft Excel Document...");
    }

}