import java.util.ArrayList;
import java.util.Scanner;
import java.util.InputMismatchException;

/**
 * MyUtils handles different input validations along with some messages
 */
public class MyUtils {
    // Method for input prompting ID, NAME etc.
    public static void printInfo(String message) {
        System.out.println(message+ ": ");
    }
    // method for checking unique id
    public static boolean isIdExists(ArrayList<Student> students, int id) {
        //iterate over the arrayList
        for (Student student : students) {
            if (student.getId() == id) {
                System.out.println("ID already exists. Please try a different ID.");
                return true;
            }
        }
        return false;
    }

    /**
     *
     * @param messageType of type string
     * @return a String with the appropriate message
     */

    public static String getMessage(String messageType) {
        return switch (messageType) {
            case "emptyList" -> "List is empty - No students found"; // message for empty list
            case "invalidInput" -> "Invalid input format. Please enter a valid number."; // message for invalid number input
            case "invalidCharacters"-> "Invalid input format. Please enter only alphabetic characters."; // message for invalid characters input
            case "invalidGrade" -> "Invalid grade. Grade must be between 0 and 10."; // message for grade value out of permitted range
            // Add more cases for other message types as needed
            default -> "Unknown message type";
        };
    }

    /**
     *
     * @param value of the input field ID
     * @param input the input we want to check
     * @param messageType the type of message we want to handle the error
     * @return the inserted id
     */
    public static String validateInputID(String value, String input, String messageType) {
        Scanner scanner = new Scanner(System.in);
        while (!input.matches("\\d+")) { //prevent spaces insertion
            System.out.println(MyUtils.getMessage(messageType));
            System.out.print(value);
            input = scanner.nextLine();
        }
        return input;
    }

    /**
     *
     * @param value input field NAME, SURNAME, DEPARTMENT
     * @param chars the input we want to check
     * @param messageType the type of message we want to handle the error
     * @return the validated input
     */
    public static  String validateInputChars(String value,String chars, String messageType) {
        Scanner scanner = new Scanner(System.in);
        String validatedChars = chars; // Variable to hold the validated input
        while (!validatedChars.matches("[a-zA-Z]+")) {
            System.out.println(MyUtils.getMessage(messageType));
            System.out.print(value);
            validatedChars = scanner.nextLine();
        }
        return validatedChars; // Return the validated input
    }

    /**
     *
     * @param value input grade
     * @param grade the value we want to check
     * @param messageType the type of message we want to handle the error
     * @return the validated value
     */
    public static double validateInputGrade(String value, double grade, String messageType) {
        Scanner scanner = new Scanner(System.in);
        while (grade < 0 || grade > 10.0) {
            try {
                System.out.println(MyUtils.getMessage(messageType));
                System.out.print(value);
                grade = scanner.nextDouble();

                // Check if the entered grade is within the valid range
                if (grade >= 0 && grade <= 10.0) {
                    break; // Exit the loop if the grade is valid
                } else {
                    System.out.println("Invalid grade. Grade must be between 0 and 10.");
                }
            } catch (InputMismatchException e) {
                // Clear the invalid input from the scanner buffer
                scanner.next();
                System.out.println("Invalid input. Please enter a numeric value.");
            }
        }
        return grade;
    }
}
