package marignetworks



import org.junit.*
import grails.test.mixin.*

@TestFor(EvenementController)
@Mock(Evenement)
class EvenementControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/evenement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.evenementInstanceList.size() == 0
        assert model.evenementInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.evenementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.evenementInstance != null
        assert view == '/evenement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/evenement/show/1'
        assert controller.flash.message != null
        assert Evenement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/evenement/list'


        populateValidParams(params)
        def evenement = new Evenement(params)

        assert evenement.save() != null

        params.id = evenement.id

        def model = controller.show()

        assert model.evenementInstance == evenement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/evenement/list'


        populateValidParams(params)
        def evenement = new Evenement(params)

        assert evenement.save() != null

        params.id = evenement.id

        def model = controller.edit()

        assert model.evenementInstance == evenement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/evenement/list'

        response.reset()


        populateValidParams(params)
        def evenement = new Evenement(params)

        assert evenement.save() != null

        // test invalid parameters in update
        params.id = evenement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/evenement/edit"
        assert model.evenementInstance != null

        evenement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/evenement/show/$evenement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        evenement.clearErrors()

        populateValidParams(params)
        params.id = evenement.id
        params.version = -1
        controller.update()

        assert view == "/evenement/edit"
        assert model.evenementInstance != null
        assert model.evenementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/evenement/list'

        response.reset()

        populateValidParams(params)
        def evenement = new Evenement(params)

        assert evenement.save() != null
        assert Evenement.count() == 1

        params.id = evenement.id

        controller.delete()

        assert Evenement.count() == 0
        assert Evenement.get(evenement.id) == null
        assert response.redirectedUrl == '/evenement/list'
    }
}
