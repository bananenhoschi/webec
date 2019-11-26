package graded

class Note {

    double note;

    Note(String note){
        this.note = Double.valueOf(note)
    }

    // Gewichtung in Prozent Werten
    double gewichtung;

    static belongsTo = [modul: Modul]

    static constraints = {
        gewichtung(min: 0.0d, max: 1.0d)
        note(min: 1.0d, max: 6.0d)
    }
}
