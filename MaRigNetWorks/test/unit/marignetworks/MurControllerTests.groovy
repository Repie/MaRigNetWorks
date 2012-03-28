package marignetworks



import org.junit.*
import grails.test.mixin.*

@TestFor(MurController)
@Mock(Mur)
class MurControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mur/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.murInstanceList.size() == 0
        assert model.murInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.murInstance != null
    }

    void testSave() {
        controller.save()

        assert model.murInstance != null
        assert view == '/mur/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mur/show/1'
        assert controller.flash.message != null
        assert Mur.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mur/list'


        populateValidParams(params)
        def mur = new Mur(params)

        assert mur.save() != null

        params.id = mur.id

        def model = controller.show()

        assert model.murInstance == mur
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mur/list'


        populateValidParams(params)
        def mur = new Mur(params)

        assert mur.save() != null

        params.id = mur.id

        def model = controller.edit()

        assert model.murInstance == mur
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mur/list'

        response.reset()


        populateValidParams(params)
        def mur = new Mur(params)

        assert mur.save() != null

        // test invalid parameters in update
        params.id = mur.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mur/edit"
        assert model.murInstance != null

        mur.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mur/show/$mur.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mur.clearErrors()

        populateValidParams(params)
        params.id = mur.id
        params.version = -1
        controller.update()

        assert view == "/mur/edit"
        assert model.murInstance != null
        assert model.murInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mur/list'

        response.reset()

        populateValidParams(params)
        def mur = new Mur(params)

        assert mur.save() != null
        assert Mur.count() == 1

        params.id = mur.id

        controller.delete()

        assert Mur.count() == 0
        assert Mur.get(mur.id) == null
        assert response.redirectedUrl == '/mur/list'
    }
}
