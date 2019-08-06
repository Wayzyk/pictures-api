Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_extension_type => :json,
    :api_file_path => "app/controllers/v1/",
    :clean_directory => false,
    :parent_controller => V1::ApiController,
    :attributes => {
      :info => {
        "title" => "Pictures-API",
        "description" => "Rails API for scaling pictures",
        "contact" => "romakorobko@gmail.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})
