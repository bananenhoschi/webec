package graded

import javax.persistence.Column

class Note {

    Note(String note) {
        this.note = Double.valueOf(note)
    }

    @Column(precision = 2, scale = 3)
    Double note; // Note

    @Column(precision = 2, scale = 3)
    Double gewichtung; // Gewichtung in Prozent Werten

    static belongsTo = [modul: Modul]

    static mapping = {
        id generator:'sequence', params:[sequence_name:'note_seq']
    }

    static constraints = {
        gewichtung(nullable: true, min: 0.0d, max: 1.0d)
        note(nullable: true, max: 6.0d)
    }


    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", version=" + version +
                ", modul=" + modul +
                ", note=" + note +
                '}';
    }
}
