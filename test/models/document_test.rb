require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "Document request by name returns a document" do
    create :document, name: 'controller_doc', active: true

    assert_routing '/controller_doc', controller: 'document', action: 'show', name: 'controller_doc'
  end

  test "Showing a document displays its fields" do
    doc = create :document_sheet, name: 'documents_controller', active: true

    get :show, name: 'documents_controller'
    assert_response :success

    do_test_id_card doc
    do_test_checklist doc.checks
    do_test_reviews doc.reviews
    do_test_alternatives doc.themes
  end
  test "new request returns new document form" do
    assert_routing '/new', :controller => "documents", :action => "new"
  end

  test "new is for signed_in users only" do
    get :new
    assert_response :forbidden
  end
    test "create request routes to the create action" do
    assert_routing '/create', :controller => "documents", :action => "create"
  end

  test "create is for signed_in users only" do
    post :create
    assert_response :forbidden
  end

  test "create assigns logged_in user as author to the new document and its lines" do
    doc = attributes_for(:document).except(:name)
    user = sign_in_new_user

    post :create, doc: doc, name: 'created_doc'
    created = Document.sheet 'created_doc'
    assert_equal user, created.author
  end
end
