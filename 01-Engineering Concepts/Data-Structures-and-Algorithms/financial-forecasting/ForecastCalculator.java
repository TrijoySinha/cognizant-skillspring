public class ForecastCalculator {

    // Recursive method to calculate future value
    public static double calculateFutureValue(double currentValue, double growthRate, int years) {

        // Base Case
        if (years == 0) {
            return currentValue;
        }

        // Recursive Case
        return calculateFutureValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

}