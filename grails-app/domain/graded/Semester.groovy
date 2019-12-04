package graded

class Semester {

    SemesterTyp semesterTyp;

    int jahr;

    static hasMany = [modules: Modul]

    static mapping = {
        id generator: 'sequence', params: [sequence_name: 'semester_seq']
    }

    static constraints = {
        jahr(min: 10, max: 99)
    }
    
    // TODO Use Lombok
    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Semester semester = (Semester) o

        if (jahr != semester.jahr) return false
        if (id != semester.id) return false
        if (semesterTyp != semester.semesterTyp) return false
        if (version != semester.version) return false

        return true
    }

    // TODO Use Lombok
    int hashCode() {
        int result
        result = (semesterTyp != null ? semesterTyp.hashCode() : 0)
        result = 31 * result + jahr
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        return result
    }

    @Override
    String toString() {
        return semesterTyp.name() + ' ' + jahr
    }

}
