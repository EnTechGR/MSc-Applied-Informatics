public class Student implements java.io.Serializable {
    private int id;
    private String stName;
    private String stSurname;
    private String stDepartment;
    private double stGrade;
    public Student(int id, String name, String surname, String department, double grade) {
        this.id = id;
        this.stName = name;
        this.stSurname = surname;
        this.stDepartment = department;
        this.stGrade = grade;

    }

    /**
     * GETTERS
     */
    public int getId() {
        return id;
    }
    public String getName() {
        return stName;
    }
    public String getSurname() {
        return stSurname;
    }
    public String getDepartment() {
        return stDepartment;
    }
    public double getGrade() {
        return stGrade;
    }

    /**
     * SETTERS
     */
    public void setId(int id) {
        this.id = id;
    }
    public void setName(String name) {
        this.stName = name;
    }
    public void setSurname(String surname) {
        this.stSurname = surname;
    }
    public void setDepartment(String department) {
        this.stDepartment = department;
    }
    public void setGrade(double grade) {
        this.stGrade = grade;
    }



    @Override
    public String toString() {
        return  "Student{ " +
                "id=" + id +
                ", Name='" + stName + '\'' +
                ", Surname='" + stSurname + '\'' +
                ", Department='" + stDepartment + '\'' +
                ", Grade=" + stGrade +
                " }";
    }
}
