resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "dataset_tf"
  friendly_name               = "example_dataset"
  description                 = "This is a BigQuery dataset from terraform Script"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "bar"

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}

resource "google_bigquery_table" "sheet" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/chemin_vers_la_source",
    ]
  }
}

