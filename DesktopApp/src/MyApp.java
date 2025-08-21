import java.io.*;
import java.util.*;

public class MyApp {
    /**
     * Selection 1.View all students
     * @param students arrayList
     */
    public static void viewAllStudents(ArrayList<Student> students) {
        if (students.isEmpty()) {
            System.out.println(MyUtils.getMessage("emptyList"));
        }else {
            System.out.println(students); //return all students
        }
    }
    /**
     * Selection 2.Add student
     * @param students arrayList
     */
    public static void addStudent(ArrayList<Student> students) {
        Scanner myEntry = new Scanner(System.in);
        System.out.println("Please add ID, Name, Surname, Department, Grade: PRESS ENTER AFTER EACH ITEM INSERTION");
        while (true) {
            try {
                // ID
                MyUtils.printInfo("ID");
                String input = myEntry.nextLine();
                input = MyUtils.validateInputID("ID: ", input, "invalidInput");
                int id = Integer.parseInt(input); //read input
                if (MyUtils.isIdExists(students, id)) {
                    continue;
                }

                // NAME
                MyUtils.printInfo("NAME");
                String name = myEntry.nextLine(); //read input
                name = MyUtils.validateInputChars("NAME: ", name, "invalidCharacters");

                // SURNAME
                MyUtils.printInfo("SURNAME");
                String surname = myEntry.nextLine();
                surname = MyUtils.validateInputChars("SURNAME: ", surname, "invalidCharacters");

                // DEPARTMENT
                MyUtils.printInfo("DEPARTMENT");
                String department = myEntry.nextLine();
                department = MyUtils.validateInputChars("DEPARTMENT: ", department, "invalidCharacters");

                // GRADE
                double grade;
                while (true) {
                    try {
                        MyUtils.printInfo("GRADE");
                        grade = myEntry.nextDouble();
                        grade = MyUtils.validateInputGrade("GRADE: ", grade, "invalidGrade");
                        break;
                    } catch (InputMismatchException e) {
                        System.out.println(MyUtils.getMessage("invalidInput"));
                        myEntry.nextLine();
                    }
                }
                Student myStudent = new Student(id, name, surname, department, grade); //create new Student
                students.add(myStudent); //add new Student
                System.out.println("New Student added successfully");
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage());
                myEntry.nextLine();
            }
            break;
        }
    }

    /**
     * Selection 3.Delete a student
     * @param students arrayList
     */
    public static void deleteStudent(ArrayList<Student> students) {
        Scanner myEntry = new Scanner(System.in);
        if (students.isEmpty()) {
            System.out.println(MyUtils.getMessage("emptyList"));
        } else {
            try {
                System.out.println("Select student's id to delete");
                // ID
                String input = myEntry.nextLine();
                input = MyUtils.validateInputID("ID: ", input, "invalidInput");
                int selection = Integer.parseInt(input);

                //Find the student with the matching ID
                Student toDeleteStudent = null;
                for (Student student : students ) {
                    if (student.getId() == selection ) {
                        toDeleteStudent = student;
                        break;
                    }
                }
                if (toDeleteStudent != null) {
                    students.remove(toDeleteStudent);
                    System.out.println(toDeleteStudent + " removed.");
                } else {
                    System.out.println("Student not found");
                }


            } catch (IndexOutOfBoundsException e) {
                System.out.println("ID out of range, please try again.");
            } catch (InputMismatchException e) {
                System.out.println("Invalid input format. Please enter a valid number next time.");
            }
        }
    }

    /**
     * Selection 4.Modify a student
     * @param students arrayList
     */
    public static void modifyStudent(ArrayList<Student> students) {
        Scanner myEntry = new Scanner(System.in);
        if (students.isEmpty()) {
            System.out.println(MyUtils.getMessage("emptyList"));
        } else {
            while (true) {
                try {
                    System.out.println("Select student's id to modify");
                    // ID
                    String input = myEntry.nextLine();
                    input = MyUtils.validateInputID("ID: ", input, "invalidInput");
                    int selection = Integer.parseInt(input);

                    //Find the student with the matching ID
                    Student toModifyStudent = null;
                    for (Student student : students ) {
                        if (student.getId() == selection ) {
                            toModifyStudent = student;
                            break;
                        }
                    }
                    if (toModifyStudent != null) {
                        System.out.println("You selected: "+ toModifyStudent);
                        System.out.println("Please modify Name, Surname, Department, Grade: PRESS ENTER AFTER EACH ITEM INSERTION");
                        // NAME
                        MyUtils.printInfo("NAME");
                        String name = myEntry.nextLine(); //read input
                        name = MyUtils.validateInputChars("NAME: ", name, "invalidCharacters");


                        MyUtils.printInfo("SURNAME");
                        String surname = myEntry.nextLine();
                        surname = MyUtils.validateInputChars("SURNAME: ", surname, "invalidCharacters");

                        MyUtils.printInfo("DEPARTMENT");
                        String department = myEntry.nextLine();
                        department = MyUtils.validateInputChars("DEPARTMENT: ", department, "invalidCharacters");

                        // GRADE
                        double grade;
                        while (true) {
                            try {
                                MyUtils.printInfo("GRADE");
                                grade = myEntry.nextDouble();
                                grade = MyUtils.validateInputGrade("GRADE: ", grade, "invalidGrade");
                                break;
                            } catch (InputMismatchException e) {
                                System.out.println(MyUtils.getMessage("invalidInput"));
                                myEntry.nextLine();
                            }
                        }

                        toModifyStudent.setName(name);
                        toModifyStudent.setSurname(surname);
                        toModifyStudent.setDepartment(department);
                        toModifyStudent.setGrade(grade);
                        System.out.println("Student modified successfully");
                        break;
                    } else {
                        System.out.println("Student not found");
                        break;
                    }
                } catch (IndexOutOfBoundsException e) {
                    System.out.println("ID out of range");
                }
            }
        }

    }

    /**
     * Selection 5.Print student
     * @param students arrayList
     */
    public static void printStudent(ArrayList<Student> students) {
        Scanner myEntry = new Scanner(System.in);
        if (students.isEmpty()) {
            System.out.println(MyUtils.getMessage("emptyList"));
        } else {
            try {
                System.out.println("Select student's id to show");
                // ID
                String input = myEntry.nextLine();
                input = MyUtils.validateInputID("ID: ", input, "invalidInput");
                int selection = Integer.parseInt(input);

                //Find the student with the matching ID
                Student toPrintStudent = null;
                for (Student student : students ) {
                    if (student.getId() == selection ) {
                        toPrintStudent = student;
                        break;
                    }
                }
                if (toPrintStudent != null) {
                    System.out.println(toPrintStudent);
                } else {
                    System.out.println("Student not found");
                }
            } catch (IndexOutOfBoundsException e) {
                System.out.println("ID out of range");
            }
        }

    }

    /**
     * Selection 6.Sort by grade
     * @param students arrayList
     */
    public static void sortByGrade(ArrayList<Student> students) {
        if (students.isEmpty()) {
            System.out.println(MyUtils.getMessage("emptyList"));
        } else {
            Comparator<Student> gradeComparator = Comparator.comparingDouble(Student::getGrade);
            students.sort(gradeComparator.reversed());

            // Print each student's information separately
            for (Student student : students) {
                System.out.println(student);
            }
        }

    }

    /**
     * Selection 7.Save to file
     * @param students arrayList
     */
    public static void saveToFile(ArrayList<Student> students) {
        Scanner myEntry = new Scanner(System.in);
        System.out.print("Enter the file name to save (e.g. students): ");
        String fileName = myEntry.nextLine();
        try {
            FileOutputStream fileOut = new FileOutputStream(fileName);
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(students);
            out.close();
            fileOut.close();
            System.out.printf("Serialized data is saved in " + fileName + '\n');
        } catch (IOException e) {
            System.out.println("Error saving data to file: " + e.getMessage());
        }
    }

    /**
     * Selection 8.Load from file
     * @return arrayList of type Student
     */
    public static ArrayList<Student> loadFromFile() {
        Scanner myEntry = new Scanner(System.in);
        System.out.print("Enter the file name to load (e.g. students): ");
        String fileName = myEntry.nextLine();
        ArrayList<Student> students = null;
        try {
            FileInputStream fileIn = new FileInputStream(fileName);
            ObjectInputStream in = new ObjectInputStream(fileIn);
            students = (ArrayList<Student>) in.readObject();
            in.close();
            fileIn.close();
        } catch (IOException e) {
            System.out.println("Error reading from file: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading data: " + e.getMessage());
        }
        System.out.println("Load successfully. Here are the results:");
        return students;
    }
}
