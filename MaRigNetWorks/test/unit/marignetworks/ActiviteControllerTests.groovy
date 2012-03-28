package marignetworks



import org.junit.*
import grails.test.mixin.*

@TestFor(ActiviteController)
@Mock(Activite)
class ActiviteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activite/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activiteInstanceList.size() == 0
        assert model.activiteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.activiteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activiteInstance != null
        assert view == '/activite/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activite/show/1'
        assert controller.flash.message != null
        assert Activite.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activite/list'


        populateValidParams(params)
        def activite = new Activite(params)

        assert activite.save() != null

        params.id = activite.id

        def model = controller.show()

        assert model.activiteInstance == activite
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activite/list'


        populateValidParams(params)
        def activite = new Activite(params)

        assert activite.save() != null

        params.id = activite.id

        def model = controller.edit()

        assert model.activiteInstance == activite
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activite/list'

        response.reset()


        populateValidParams(params)
        def activite = new Activite(params)

        assert activite.save() != null

        // test invalid parameters in update
        params.id = activite.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activite/edit"
        assert model.activiteInstance != null

        activite.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activite/show/$activite.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activite.clearErrors()

        populateValidParams(params)
        params.id = activite.id
        params.version = -1
        controller.update()

        assert view == "/activite/edit"
        assert model.activiteInstance != null
        assert model.activiteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activite/list'

        response.reset()

        populateValidParams(params)
        def activite = new Activite(params)

        assert activite.save() != null
        assert Activite.count() == 1

        params.id = activite.id

        controller.delete()

        assert Activite.count() == 0
        assert Activite.get(activite.id) == null
        assert response.redirectedUrl == '/activite/list'
    }
}
