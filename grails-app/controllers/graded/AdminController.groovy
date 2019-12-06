package graded

import grails.plugin.springsecurity.annotation.Secured

class AdminController {

    @Secured(Role.ADMIN)
    def index() {}
}
