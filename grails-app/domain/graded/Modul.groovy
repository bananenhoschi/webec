package graded

class Modul {

    String modulKuerzel;
    String modulBezeichnung;
    String dozent;
    int credits;

    // Default ist true, die meisten Module haben eine MSP
    boolean hasMsp = true;
    // Default ist false, nur wenige Module haben eine Testat Arbeit
    boolean isTestat = false;

    Set<Note> ens = new HashSet<>()
    Note msp;

    static belongsTo = [semester: Semester]

    boolean passed() {

        if (isTestat) {
            return true
        }

        double en = 1.0
        for (Note note : ens) {
            en += note.note * note.gewichtung
        }

        if (hasMsp && msp) {
            return 3.75 <= (Math.round((msp.note + en) / 2) * 2) / 2
        }

        return false
    }

    static constraints = {

        // Mindestens das Modulkürzel muss erfasst sein
        modulKuerzel(nullable: false)
        modulBezeichnung(nullable: true)
        dozent(nullable: true)
        msp(nullable: true)
        ens(nullable: true)
        // Credits sind zwischen 2 für Kontext und 12 für IP6
        credits(min: 2, max: 12)
    }
}
