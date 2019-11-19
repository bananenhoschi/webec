package graded

import java.awt.print.Book

class Semester {

    SemesterTyp semesterTyp;
    int jahr;

    // static hasMany = [module: Modul]

    static constraints = {
        jahr(min: 10, max: 99)
    }
}
