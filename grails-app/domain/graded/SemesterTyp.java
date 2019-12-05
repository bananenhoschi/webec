package graded;

public enum SemesterTyp {

    VOR("Vorbildung"),
    FS("Frühlingsemseter"),
    HS("Herbstsemester");

    String name;

    SemesterTyp(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
