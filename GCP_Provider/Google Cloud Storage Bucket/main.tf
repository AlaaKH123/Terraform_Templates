#En résumé, ce fichier Terraform configure un bucket de stockage Google Cloud pour 
#héberger un site statique avec des configurations spécifiques pour le site web, l'accès 
#uniforme au niveau du bucket et les règles CORS.


resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"] # Les requetes accepteés 
    response_header = ["*"]
    max_age_seconds = 3600
  }
}