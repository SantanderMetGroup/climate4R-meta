# R/remotes_check.R

#' Climate4R Remotes Consistency Check
#'
#' Verifies that the versions declared in Imports match the versions (tags) specified in Remotes.
#'
#' @return Invisibly returns TRUE if all checks pass; otherwise, issues warnings.
#' @export
climate4R_check_remotes_consistency <- function() {
  imports_versions_full <- .parse_imports_versions_full()
  remotes_versions <- .parse_remotes_versions()
  
  all_ok <- TRUE
  
  for (pkg in names(imports_versions_full)) {
    req <- imports_versions_full[[pkg]]
    
    if (!is.null(req$operator) && req$operator == "==") {
      if (!pkg %in% names(remotes_versions)) {
        warning(sprintf("Package '%s' is listed in Imports with '==', but not found in Remotes.", pkg))
        all_ok <- FALSE
      } else {
        if (req$version != remotes_versions[[pkg]]) {
          warning(sprintf(
            "Mismatch for package '%s': Imports requires '%s', but Remotes points to '%s'.",
            pkg, req$version, remotes_versions[[pkg]]
          ))
          all_ok <- FALSE
        }
      }
    }
  }
  
  if (all_ok) {
    message("Climate4R remotes consistency check passed: Imports and Remotes are aligned.")
  }
  
  invisible(all_ok)
}
