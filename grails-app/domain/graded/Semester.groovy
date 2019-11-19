package graded

class Semester {

    SemesterTyp semesterTyp;
    int jahr;

    static hasMany = [modules: Modul]

    static constraints = {
        jahr(min: 10, max: 99)
    }
}
