module Civo
  class Database < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:region], fake: :databases
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:name, :size, :region, :software, :network_id], fake: :create_database
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:region], fake: :get_database
    patch :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:region], fake: :update_database
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id, :region], fake: :delete_database
    post :restore, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/restore", requires: [:region, :snapshot_id], fake: :restore_database

    def to_partial_path
      "civo/database"
    end

    def databases
      [
        {
          "id": "5cc0696d-6663-48a9-8123-87adb997138c",
          "name": "Mysite-DB",
          "replicas": 2,
          "size": "g3.db.large",
          "software": "PostgreSQL",
          "software_version": "10.1",
          "public_ip": "84.127.44.100",
          "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
          "firewall_id": "e9682561-eaaf-4d01-ae12-322d5141b644",
          "username": "abcde1234",
          "password": "fghij567890",
          "status": "ready",
          "snapshots": [
            {
              "id": "5cc0696d-6663-48a9-8123-87adb997138c",
              "timestamp": "2021-12-04T10:00:28Z"
            }
          ]
        }
      ].to_json
    end

    def get_database
      {
          "id": "5cc0696d-6663-48a9-8123-87adb997138c",
          "name": "Mysite-DB",
          "replicas": 2,
          "size": "g3.db.large",
          "software": "PostgreSQL",
          "software_version": "10.1",
          "public_ip": "84.127.44.100",
          "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
          "firewall_id": "e9682561-eaaf-4d01-ae12-322d5141b644",
          "username": "abcde1234",
          "password": "fghij567890",
          "status": "ready",
          "snapshots": [
            {
              "id": "5cc0696d-6663-48a9-8123-87adb997138c",
              "timestamp": "2021-12-04T10:00:28Z"
            }
          ]
        }.to_json
    end

    def create_database
      {
        "id": "5cc0696d-6663-48a9-8123-87adb997138c",
        "name": "Mysite-DB",
        "replicas": 2,
        "size": "g3.db.large",
        "software": "PostgreSQL",
        "software_version": "10.1",
        "public_ip": "84.127.44.100",
        "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
        "firewall_id": "e9682561-eaaf-4d01-ae12-322d5141b644",
        "username": "abcde1234",
        "password": "fghij567890",
        "status": "building",
        "snapshots": []
      }.to_json
    end

    def update_database
      {
        "id": "5cc0696d-6663-48a9-8123-87adb997138c",
        "name": "Mysite-DB-renamed",
        "replicas": 3,
        "size": "g3.db.xlarge",
        "software": "PostgreSQL",
        "software_version": "10.1",
        "public_ip": "84.127.44.100",
        "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
        "firewall_id": "e9682561-eaaf-4d01-ae12-322d5141b644",
        "username": "abcde1234",
        "password": "fghij567890",
        "status": "building",
        "snapshots": []
      }.to_json
    end

    def restore_database
      { result: "OK" }.to_json
    end

    def delete_database
      { result: "OK" }.to_json
    end

  end
end
