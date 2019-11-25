package graded

class Semester {

    SemesterTyp semesterTyp;
    int jahr;

    static hasMany = [modules: Modul]

    @Override
    String toString() {
        return semesterTyp.name() + ' ' + jahr
    }
    static constraints = {
        jahr(min: 10, max: 99)
    }
}
