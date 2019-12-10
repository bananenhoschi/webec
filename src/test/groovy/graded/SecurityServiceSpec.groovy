package graded

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

@Integration
@Rollback
class SecurityServiceSpec extends Specification implements ServiceUnitTest<SecurityService> {

    SecurityService securityService


    void "test create"() {

        Role role = new Role(authority: 'ROLE').save(failOnError: true)
        User user = new User(username: 'test', password: 'test').save(failOnError: true)

        def userRole = securityService.create(user, role)

        expect:
        userRole != null
    }

}
