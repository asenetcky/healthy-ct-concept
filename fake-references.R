
# @misc{placeholder1,
#     author = {Smith, John J.},
#     isbn = {999999999999999},
#     title = {Placeholders: This isn't real},
#     booktitle = {Nothing is Real},
#     publisher = {Placeholder University Press},
#     year = {2019},
#     month = {07},
#     pages = {29-49},
#     abstract = {I am not a real reference},
#     doi = {99.9999/000/999999999999.000.0000},
#     url = {https://},
#     eprint = {somepdf}
#   }

# ref name, just placeholder + rownumber
type <- c("journal", "misc", "website")
author <- c("Smith, John J.", "Smith, Johanna J.")
isbn <- "999999999999999"

# title placeholders: this isn't real + row number
# booktitle placeholders: nothing is real + row number

publisher <- "Placeholder University Press"
year <- c(2015:2024)
month <- c(9:12)

# abstract: I am not a real reference + row number
doi <- "99.9999/000/999999999999.000.0000"
url <- "https://"

fake_ref_matrix <-
  tidyr::expand_grid(
    type = type,
    author = author,
    isbn = isbn,
    publisher = publisher,
    year = year,
    month = month,
    doi = doi,
    url = url
  ) |>
  mutate(
    id = row_number()
  ) |>
  slice_sample(n = 60) |>
  mutate(
    title = paste("Placeholders: This isn't real", id),
    booktitle = paste("Nothing is Real", id),
    abstract = paste("I am not a real reference", id)
  )

fs::file_create("fake-references.bib")

for (i in 1:nrow(fake_ref_matrix)) {
  readr::write_lines(
    c(
      paste0("@", fake_ref_matrix$type[i], "{placeholder", i, ","),
      paste0("    author = {", fake_ref_matrix$author[i], "},"),
      paste0("    isbn = {", fake_ref_matrix$isbn[i], "},"),
      paste0("    title = {", fake_ref_matrix$title[i], "},"),
      paste0("    booktitle = {", fake_ref_matrix$booktitle[i], "},"),
      paste0("    publisher = {", fake_ref_matrix$publisher[i], "},"),
      paste0("    year = {", fake_ref_matrix$year[i], "},"),
      paste0("    month = {", fake_ref_matrix$month[i], "},"),
      paste0("    abstract = {", fake_ref_matrix$abstract[i], "},"),
      paste0("    doi = {", fake_ref_matrix$doi[i], "},"),
      paste0("    url = {", fake_ref_matrix$url[i], "},"),
      paste0("}"),
      paste0("")
    ),
    file = "fake-references.bib",
    sep = "\n",
    append = TRUE
  )
}
