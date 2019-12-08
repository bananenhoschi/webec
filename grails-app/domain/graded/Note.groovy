package graded

import javax.persistence.Column

class Note {

    Note(String note) {
        this.note = Double.valueOf(note)
    }

    @Column(precision = 2, scale = 3)
    Double note; // Note

    static belongsTo = [modul: Modul]

    static mapping = {
        id generator:'sequence', params:[sequence_name:'note_seq']
    }

    static constraints = {
        note(nullable: true, max: 6.0d)
    }

}
