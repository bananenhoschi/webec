package graded;

public enum SemesterTyp {

    VOR("Vorbildung"),
    HS("Herbstsemester"),
    FS("Frühlingsemseter");

    String name;

    SemesterTyp(String name) {
        this.name = name;
    }

}
