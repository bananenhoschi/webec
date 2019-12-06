package graded

import grails.plugin.springsecurity.annotation.Secured

@Secured(Role.ADMIN)
class AdminController {


    def index() {}
}
