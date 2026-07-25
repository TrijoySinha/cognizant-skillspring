package com.cognizant.junit;


import static org.junit.Assert.assertEquals;
import org.junit.Test;


public class CalculatorTest {


    @Test
    public void testAddition(){

        Calculator calculator = new Calculator();


        int result = calculator.add(2,3);


        assertEquals(5,result);

    }

}