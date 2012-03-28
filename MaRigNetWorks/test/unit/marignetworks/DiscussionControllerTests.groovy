package marignetworks



import org.junit.*
import grails.test.mixin.*

@TestFor(DiscussionController)
@Mock(Discussion)
class DiscussionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/discussion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.discussionInstanceList.size() == 0
        assert model.discussionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.discussionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.discussionInstance != null
        assert view == '/discussion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/discussion/show/1'
        assert controller.flash.message != null
        assert Discussion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/discussion/list'


        populateValidParams(params)
        def discussion = new Discussion(params)

        assert discussion.save() != null

        params.id = discussion.id

        def model = controller.show()

        assert model.discussionInstance == discussion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/discussion/list'


        populateValidParams(params)
        def discussion = new Discussion(params)

        assert discussion.save() != null

        params.id = discussion.id

        def model = controller.edit()

        assert model.discussionInstance == discussion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/discussion/list'

        response.reset()


        populateValidParams(params)
        def discussion = new Discussion(params)

        assert discussion.save() != null

        // test invalid parameters in update
        params.id = discussion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/discussion/edit"
        assert model.discussionInstance != null

        discussion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/discussion/show/$discussion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        discussion.clearErrors()

        populateValidParams(params)
        params.id = discussion.id
        params.version = -1
        controller.update()

        assert view == "/discussion/edit"
        assert model.discussionInstance != null
        assert model.discussionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/discussion/list'

        response.reset()

        populateValidParams(params)
        def discussion = new Discussion(params)

        assert discussion.save() != null
        assert Discussion.count() == 1

        params.id = discussion.id

        controller.delete()

        assert Discussion.count() == 0
        assert Discussion.get(discussion.id) == null
        assert response.redirectedUrl == '/discussion/list'
    }
}
