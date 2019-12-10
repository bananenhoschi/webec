package graded

class ModulTest extends GroovyTestCase {

    void testIsPassed_Testat() {

        Modul m = new Modul()
        m.setHasTestat(true)
        m.setTestatPassed(true)

        assertTrue(m.isPassed())
        assertTrue(m.isCompleted())
    }


    void testIsPassed_KeinTestat() {

        Modul m = new Modul()
        m.setHasTestat(false)
        m.setTestatPassed(true)

        assertFalse(m.isPassed())
        assertFalse(m.isCompleted())

        m.setHasTestat(true)
        m.setTestatPassed(false)

        assertFalse(m.isPassed())
        assertFalse(m.isCompleted())

    }

    void testIsPassed_Msp(){

        Modul m = new Modul()
        m.setHasMsp(true)
        m.setAnzahlNoten(1)

        Note en = new Note()
        en.setNote(4.0)
        m.setNoten(Set.of(en))

        Note msp = new Note()
        msp.setNote(4.0)
        m.setMsp(msp)

        assertTrue(m.isPassed())
        assertTrue(m.isCompleted())

    }

    void testIsPassed_MspLt375(){

        Modul m = new Modul()
        m.setAnzahlNoten(1)
        m.setHasMsp(true)

        Note en = new Note()
        en.setNote(3.0)
        m.setNoten(Set.of(en))

        Note msp = new Note()
        msp.setNote(3.0)
        m.setMsp(msp)

        assertFalse(m.isPassed())
        assertTrue(m.isCompleted())

    }


    void testIsPassed_NoMsp(){

        Modul m = new Modul()
        m.setHasMsp(false)
        m.setAnzahlNoten(1)

        Note en = new Note()
        en.setNote(4.0)
        m.setNoten(Set.of(en))

        assertTrue(m.isPassed())
        assertTrue(m.isCompleted())

    }

    void testIsCompleted() {
        Modul m = new Modul()
        m.setHasMsp(true)
        m.setAnzahlNoten(1)

        Note en = new Note()
        en.setNote(4.0)
        m.setNoten(Set.of(en))

        Note msp = new Note()
        msp.setNote(4.0)
        m.setMsp(msp)

        assertTrue(m.isPassed())
        assertTrue(m.isCompleted())
    }

    void testCompletedButNotPassed() {
        Modul m = new Modul()
        m.setHasMsp(true)
        m.setAnzahlNoten(1)

        Note en = new Note()
        en.setNote(3.0)
        m.setNoten(Set.of(en))

        Note msp = new Note()
        msp.setNote(3.0)
        m.setMsp(msp)

        assertFalse(m.isPassed())
        assertTrue(m.isCompleted())
    }

    void testNotCompletedNoMsp() {
        Modul m = new Modul()
        m.setHasMsp(false)
        m.setAnzahlNoten(0)

        assertFalse(m.isPassed())
        assertFalse(m.isCompleted())
    }
}