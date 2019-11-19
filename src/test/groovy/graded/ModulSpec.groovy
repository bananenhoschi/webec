package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification

@Integration
@Rollback
class ModulSpec extends Specification {

    void setup() {
        new Modul(modulKuerzel: "algd1", modulBezeichnung: "Algorithmen und Datenstrukturen", dozent: "M. Henninger", credits: 3, hasMsp: true).save(flush: true)
    }

    void "test persist"() {
        expect:
            Modul.count() == 1
    }
}
