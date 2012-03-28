package marignetworks

import org.springframework.dao.DataIntegrityViolationException

class EvenementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [evenementInstanceList: Evenement.list(params), evenementInstanceTotal: Evenement.count()]
    }

    def create() {
        [evenementInstance: new Evenement(params)]
    }

    def save() {
        def evenementInstance = new Evenement(params)
        if (!evenementInstance.save(flush: true)) {
            render(view: "create", model: [evenementInstance: evenementInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'evenement.label', default: 'Evenement'), evenementInstance.id])
        redirect(action: "show", id: evenementInstance.id)
    }

    def show() {
        def evenementInstance = Evenement.get(params.id)
        if (!evenementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "list")
            return
        }

        [evenementInstance: evenementInstance]
    }

    def edit() {
        def evenementInstance = Evenement.get(params.id)
        if (!evenementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "list")
            return
        }

        [evenementInstance: evenementInstance]
    }

    def update() {
        def evenementInstance = Evenement.get(params.id)
        if (!evenementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (evenementInstance.version > version) {
                evenementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'evenement.label', default: 'Evenement')] as Object[],
                          "Another user has updated this Evenement while you were editing")
                render(view: "edit", model: [evenementInstance: evenementInstance])
                return
            }
        }

        evenementInstance.properties = params

        if (!evenementInstance.save(flush: true)) {
            render(view: "edit", model: [evenementInstance: evenementInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'evenement.label', default: 'Evenement'), evenementInstance.id])
        redirect(action: "show", id: evenementInstance.id)
    }

    def delete() {
        def evenementInstance = Evenement.get(params.id)
        if (!evenementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "list")
            return
        }

        try {
            evenementInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'evenement.label', default: 'Evenement'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
