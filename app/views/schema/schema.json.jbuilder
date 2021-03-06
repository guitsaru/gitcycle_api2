json.set! "branch.json" do
  json.get do
    json.request do
      json.title    "GET branch.json (request)"
      json.partial! "schema/branch", req: "GET"
    end
    
    json.response do
      json.title    "GET branch.json (response)"
      json.partial! "schema/branch", res: "GET"
    end
  end
  
  json.post do
    json.request do
      json.title    "POST branch.json (request)"
      json.partial! "schema/branch", req: "POST"
    end
    
    json.response do
      json.title    "POST branch.json (response)"
      json.partial! "schema/branch", res: "POST"
    end
  end

  json.put do
    json.request do
      json.title    "PUT branch.json (request)"
      json.partial! "schema/branch", req: "PUT"
    end
    
    json.response do
      json.title    "PUT branch.json (response)"
      json.partial! "schema/branch", res: "PUT"
    end
  end
end

json.set! "issues.json" do
  json.get do
    json.request do
      json.title "GET issues.json (request)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.issues { json.type "string" }
      end
    end
    
    json.response do
      json.title "GET issues.json (response)"
      json.type  "array"
      json.items do
        json.partial! "schema/branch", source_branch: true, title_optional: false
      end
    end
  end

  json.put do
    json.request do
      json.title "PUT issues.json (request)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.issues { json.type "string" }
        json.state  { json.type "string" }
      end
    end
    
    json.response do
      json.title "PUT issues.json (response)"
      json.type  "array"
      json.items do
        json.partial! "schema/branch", source_branch: true
      end
    end
  end
end

json.set! "logs.json" do
  json.post do
    json.request do
      json.title "POST logs.json (request)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.events do
          json.type  "array"
          json.items do
            json.type  "object"
            json.additionalProperties false
            json.properties do
              json.event      { json.type "string" }
              json.body       { json.type "string" }
              json.backtrace  { json.type "string" }
              json.ran_at     { json.type "integer" }
            end
          end
        end
      end
    end

    json.response do
      json.title "POST logs.json (response)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.id { json.type "string" }
      end
    end
  end
end

json.set! "pull_request.json" do
  json.post do
    json.request do
      json.title "POST pull_request.json (request)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.branch { json.type "string" }
        json.ready  { json.type "string"; json.enum [ "true", "false" ] }
        json.repo   { json.partial! "schema/repo" }
      end
    end

    json.response do
      json.title    "POST pull_request.json (response)"
      json.partial! "schema/branch", source_branch: true
    end
  end
end

json.set! "repo.json" do
  json.post do
    json.request do
      json.title "POST repo.json (request)"
      json.partial! "schema/repo"
    end

    json.response do
      json.title    "POST repo.json (response)"
      json.partial! "schema/repo"
    end
  end
end

json.set! "setup/lighthouse.json" do
  json.get do
    json.request do
      json.title "POST setup/lighthouse.json (request)"
      json.type  "object"
      json.additionalProperties false
      json.properties do
        json.token { json.type "string" }
      end
    end

    json.response do
      json.title "POST setup/lighthouse.json (response)"
      json.type  "null"
      json.additionalProperties false
    end
  end
end