package graded

import grails.gorm.transactions.Transactional

@Transactional
class SecurityService {

    UserRole create(User user, Role role) {
        new UserRole(user: user, role: role).save(failOnError: true);
    }
}
