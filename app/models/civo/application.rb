module Civo
  class PlatformApplication < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications", fake: :applications
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id], fake: :find_application
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications", requires: [:name, :region, :network_id, :size, :sshkey_ids], fake: :create_application
    put :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id]
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/applications/:id", requires: [:id], fake: :remove_application

    def to_partial_path
      "civo/application"
    end

    def applications
      [
        {
          "id": "3a9a2c87-3e61-42fb-9dc2-3d365105d4e3",
          "name": "demo-application",
          "network_id": "abe8ea57-727f-4fa4-a0ca-41793243e3df",
          "size": "small",
          "description": "Demo application description",
          "domains": [
            "demo-app.civo.app"
          ],
          "ssh_key_ids": [
            "key_id_1",
            "key_id_2"
          ],
          "config": [
            {
              "key1": "value1"
            },
            {
              "key2": "value2"
            }
          ],
          "processes": [
            {
              "web": 2
            },
            {
              "worker": 1
            },
            {
              "clock": 1
            }
          ],
          "status": "active",
          "framework": "ruby-on-rails",
          "last_deployed": "2022-03-22 08:18:28"
        }
      ].to_json
    end

    def find_application
      {
        "id": "3a9a2c87-3e61-42fb-9dc2-3d365105d4e3",
        "name": "demo-application-for-show",
        "network_id": "abe8ea57-727f-4fa4-a0ca-41793243e3df",
        "size": "small",
        "description": "Demo application description for the page",
        "domains": [
          "demo-app-for-show-page.civo.app",
        ],
        "ssh_key_ids": [
          "key_id_1",
          "key_id_2"
        ],
        "config": [
          {
            "key": "key1",
            "value": "value1"
          },
          {
            "key": "key2",
            "value": "value2"
          }
        ],
        "processes": [
          {
            "name": "web",
            "count": 2
          },
          {
            "name": "worker",
            "count": 3
          },
          {
            "name": "clock",
            "count": 1
          },
          {
            "name": "status",
            "count": 1
          }
        ],
        "status": "active",
        "framework": "ruby-on-rails",
        "last_deployed": "2022-03-22 08:18:28"
      }.to_json
    end

    def create_application
      {
        "id": "c61a47dc-7a28-437f-ae3d-f812101478e0",
        "name": "created-demo-application",
        "network_id": "abe8ea57-727f-4fa4-a0ca-41793243e3df",
        "size": "large",
        "description": "Newly created app description",
        "domains": [
          "created-demo-application.civo.app",
        ],
        "ssh_key_ids": [
          "key_id_1"
        ],
        "config": [
        ],
        "processes": [
        ], 
        "status": "building",
        "framework": "n/a"
      }.to_json
    end

    def remove_application
      {
        result: "Success"
    }.to_json
    end
  end
end