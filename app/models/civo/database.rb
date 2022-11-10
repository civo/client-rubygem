module Civo
  class Database < Base
    get :all, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", fake: :databases
    post :create, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases", requires: [:name, :size, :software, :network_id], fake: :create_database
    get :find, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id], fake: :get_database
    patch :update, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", fake: :update_database
    delete :remove, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id", requires: [:id], fake: :delete_database
    post :restore, "/v#{ENV["CIVO_API_VERSION"] || "2"}/databases/:id/restore", requires: [:snapshot_id], fake: :restore_database

    def to_partial_path
      "civo/database"
    end

    def databases
      [
        {
          "id": "dd13bc84-1224-476e-8c0c-f15630ec9523",
          "name": "dancing-in-the-moonlight-2",
          "replicas": 1,
          "size": "g3.db.xsmall",
          "software": "MySQL",
          "software_version": "8.0",
          "public_ip": "",
          "network_id": "b064d568-5869-427c-827a-77d48cde6a2e",
          "firewall_id": "0c681c22-c449-43b4-a7dc-f3644a8d21f2",
          "status": "Pending",
          "snapshots": []
        },
        {
          "id": "9c59d8dd-f514-4f6a-86bf-6bef835ac84f",
          "name": "dancing-in-the-moonlight",
          "replicas": 1,
          "size": "g3.db.xsmall",
          "software": "MySQL",
          "software_version": "8.0",
          "public_ip": "",
          "network_id": "b064d568-5869-427c-827a-77d48cde6a2e",
          "firewall_id": "0c681c22-c449-43b4-a7dc-f3644a8d21f2",
          "status": "Pending",
          "snapshots": []
        },
        {
          "id": "1de75ca8-46d3-4196-b31f-58698c0c1708",
          "name": "to-be-updated-new",
          "replicas": 2,
          "size": "g3.db.xsmall",
          "software": "MySQL",
          "software_version": "8.0",
          "public_ip": "",
          "network_id": "b064d568-5869-427c-827a-77d48cde6a2e",
          "firewall_id": "dc468f86-c96d-4f04-ac42-508885b1115f",
          "status": "Pending",
          "snapshots": []
        }
      ].to_json
    end

    def get_database
      {
        "id": "0e07ce5f-179b-44e0-83cf-47ae9ca7b4ad",
        "name": "my-user-friendly-database-name",
        "replicas": 1,
        "size": "g3.db.xsmall",
        "software": "MySQL",
        "software_version": "8.0",
        "public_ip": "10.90.100.30",
        "port": 3306,
        "username": "root",
        "password": "h03K5gID9S39nZZd",
        "network_id": "b064d568-5869-427c-827a-77d48cde6a2e",
        "firewall_id": "0c681c22-c449-43b4-a7dc-f3644a8d21f2",
        "status": "Ready"
      }.to_json
    end

    def create_database
      {
        "id": "0e07ce5f-179b-44e0-83cf-47ae9ca7b4ad",
        "name": "Mysite-DB",
        "replicas": 2,
        "size": "g3.db.xsmall",
        "software": "MySQL",
        "software_version": "8.0",
        "public_ip": "84.127.44.100",
        "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
        "snapshots": []
      }.to_json
    end

    def update_database
      {
        "id": "5cc0696d-6663-48a9-8123-87adb997138c",
        "name": "Mysite-DB-renamed",
        "replicas": 3,
        "size": 10,
        "software": "PostgreSQL",
        "software_version": "10.1",
        "public_ip": "84.127.44.100",
        "network_id": "5be0646d-6e63-4aa9-8123-87adb447138c",
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
