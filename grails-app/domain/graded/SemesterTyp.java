package graded;

public enum SemesterTyp {

    PRE("Vorbildung"),
    HS("Herbstsemester"),
    FS("Frühlingsemseter");

    private String name;

    SemesterTyp(String name) {
        this.name = name;
    }

}
