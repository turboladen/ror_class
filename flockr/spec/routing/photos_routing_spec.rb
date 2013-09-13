require "spec_helper"

describe PhotosController do
  describe "routing" do
    it "routes to #index" do
      get("/users/1/photos").should route_to(controller: 'photos',
        action: 'index', user_id: '1')
    end

    it "routes to #new" do
      get("/users/1/photos/new").should route_to(controller: 'photos',
        action: 'new', user_id: '1')
    end

    it "routes to #show" do
      get("/users/1/photos/1").should route_to(controller: 'photos',
        action: 'show', user_id: '1', id: '1')
    end

    it "routes to #edit" do
      get("/users/1/photos/1/edit").should route_to(controller: 'photos',
        action: 'edit', user_id: '1', id: '1')
    end

    it "routes to #create" do
      post("/users/1/photos").should route_to(controller: 'photos',
        action: 'create', user_id: '1')
    end

    it "routes to #update" do
      patch("/users/1/photos/1").should route_to(controller: 'photos',
        action: 'update', user_id: '1', id: '1')
    end

    it "routes to #destroy" do
      delete("/users/1/photos/1").should route_to(controller: 'photos',
        action: 'destroy', user_id: '1', id: '1')
    end

  end
end
