# R/version_check.R

#' Climate4R Version Check
#'
#' Verifies that the installed versions of the Climate4R core packages
#' match the constraints declared in the DESCRIPTION Imports field.
#'
#' @return Invisibly returns TRUE if all checks pass; otherwise, issues warnings.
#' @export
climate4R_check_versions <- function() {
  required_versions <- .parse_imports_versions_full()
  
  all_ok <- TRUE
  
  for (pkg in names(required_versions)) {
    req <- required_versions[[pkg]]
    
    if (!requireNamespace(pkg, quietly = TRUE)) {
      warning(sprintf("Required package '%s' is not installed.", pkg))
      all_ok <- FALSE
      next
    }
    
    installed_version <- as.character(packageVersion(pkg))
    
    # If no constraint specified, just confirm installation
    if (is.null(req$operator)) {
      next
    }
    
    cmp <- utils::compareVersion(installed_version, req$version)
    
    condition_met <- switch(req$operator,
                             "==" = cmp == 0,
                             ">=" = cmp >= 0,
                             "<=" = cmp <= 0,
                             ">"  = cmp > 0,
                             "<"  = cmp < 0,
                             TRUE)
    
    if (!condition_met) {
      warning(sprintf(
        "Version mismatch for package '%s': installed %s, required %s %s.",
        pkg, installed_version, req$operator, req$version
      ))
      all_ok <- FALSE
    }
  }
  
  if (all_ok) {
    message("Climate4R version check passed: all packages meet their version requirements.")
  }
  
  invisible(all_ok)
}

