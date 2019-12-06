package graded


class BootStrap {

    SecurityService securityService

    def init = { servletContext ->
        Role adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true);
        Role studentRole = new Role(authority: 'ROLE_STUDENT').save(failOnError: true);

        User user = new User(username: 'user', password: 'user').save(failOnError: true);

        securityService.create(user, studentRole);

    }
}