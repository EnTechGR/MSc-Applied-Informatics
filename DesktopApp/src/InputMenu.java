import java.util.ArrayList;
import java.util.Scanner;

public class InputMenu {
    /**
     * Display Menu
     */
    public void display_menu() {
        System.out.println(
                """
                        #######################
                        1) View all students
                        2) Add student
                        3) Delete a student
                        4) Modify a student
                        5) Print a student
                        6) Sort list of students
                        7) Save list to a file
                        8) Load list from a file
                        9) Exit
                        #######################
                        SELECTION:"""
        );
    }

    /**
     * Input selection
     */
    public InputMenu(Scanner scanner, ArrayList<Student> students) {
        int selection; //option selection
        do {
            display_menu();
            selection = scanner.nextInt(); //get selection number
            switch (selection) {
                case 1:
                    System.out.println("You selected 'View all students' ");
                    MyApp.viewAllStudents(students);
                    break;
                case 2:
                    System.out.println("You selected 'Add student' ");
                    MyApp.addStudent(students);
                    break;
                case 3:
                    System.out.println("You selected 'Delete a student' ");
                    MyApp.deleteStudent(students);
                    break;
                case 4:
                    System.out.println("You selected 'Modify a student' ");
                    MyApp.modifyStudent(students);
                    break;
                case 5:
                    System.out.println("You selected 'Print a student' ");
                    MyApp.printStudent(students);
                    break;
                case 6:
                    System.out.println("You selected 'Sort list of students' ");
                    MyApp.sortByGrade(students);
                    break;
                case 7:
                    System.out.println("You selected 'Save list to a file' ");
                    MyApp.saveToFile(students);
                    break;
                case 8:
                    System.out.println("You selected 'Load list from a file' ");
                    students = MyApp.loadFromFile();
                    // Check if loadedStudents is not null and contains data
                    if (students != null && !students.isEmpty()) {
                        for (Student student : students) {
                            System.out.println(student);
                        }
                    }
                    break;
                case 9:
                    System.out.println("You selected 'Exit' ");
                    //method();
                    break;
                default:
                    System.err.println("Unrecognized option");
                    break;
            }

        } while (selection != 9);
        scanner.close();
    }
}