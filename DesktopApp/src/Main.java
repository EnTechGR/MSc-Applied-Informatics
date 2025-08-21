import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ArrayList<Student> students= new ArrayList<>();
//        Student student1 = new Student(1,"Marinos", "Kouvaras", "DIT", 1.2);
//        Student student2 = new Student(2,"Georgios", "Krasakis", "DIT", 10.0);
//        Student student3 = new Student(3,"Marinos", "Kouvaras", "DIT", 3.2);
//        Student student4 = new Student(4,"Georgios", "Krasakis", "DIT", 4.0);
//        students.add(student1);
//        students.add(student2);
//        students.add(student3);
//        students.add(student4);
        Scanner scanner = new Scanner(System.in);
        new InputMenu(scanner, students);
        scanner.close();

    }
}