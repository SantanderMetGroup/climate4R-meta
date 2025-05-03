#' Climate4R: A Framework for Climate Data Management, Analysis, and Downscaling
#'
#' Climate4R provides a modular framework for managing, processing, analyzing, and visualizing climate data,
#' particularly focusing on datasets in NetCDF format. It integrates multiple specialized R packages,
#' offering a cohesive, reproducible, and scalable environment for climate data science and statistical downscaling.
#'
#' @docType package
#' @name climate4R
"_PACKAGE"

#' Check consistency between Imports and Remotes
#' @export
check_remotes_versions <- function() {
  imports_versions_full <- .parse_imports_versions_full()
  remotes_versions <- .parse_remotes_versions()
  all_ok <- TRUE
  for (pkg in names(imports_versions_full)) {
    req <- imports_versions_full[[pkg]]
    if (!is.null(req$operator) && req$operator == "==") {
      if (!pkg %in% names(remotes_versions)) {
        warning(sprintf("Package '%s' is listed in Imports with '==', but not found in Remotes.", pkg))
        all_ok <- FALSE
      } else if (req$version != remotes_versions[[pkg]]) {
        warning(sprintf("Mismatch for package '%s': Imports requires '%s', but Remotes points to '%s'.",
          pkg, req$version, remotes_versions[[pkg]]))
        all_ok <- FALSE
      }
    }
  }
  if (all_ok) message("Climate4R remotes consistency check passed.")
  invisible(all_ok)
}

#' Check installed versions against DESCRIPTION
#' @export
check_installed_versions <- function() {
  required_versions <- .parse_imports_versions_full()
  all_ok <- TRUE
  for (pkg in names(required_versions)) {
    if (!.check_package_version(pkg, required_versions[[pkg]])) all_ok <- FALSE
  }
  if (all_ok) {
    message("Climate4R version check passed.")
  } else {
    message("Climate4R version check FAILED.")
  }
  invisible(all_ok)
}

#' Report installed component versions
#' @export
show_installed_versions <- function() {
  required_versions <- .parse_imports_versions_full()
  installed_info <- sapply(names(required_versions), function(pkg) {
    if (requireNamespace(pkg, quietly = TRUE)) {
      as.character(packageVersion(pkg))
    } else {
      "Not Installed"
    }
  }, USE.NAMES = TRUE)
  cat("Climate4R Components Version Information:\n")
  for (pkg in names(installed_info)) {
    required_version <- required_versions[[pkg]]$version
    cat(sprintf("- %s: Installed %s | Required %s\n",
      pkg, installed_info[pkg],
      ifelse(is.null(required_version), "none", required_version)))
  }
  invisible(installed_info)
}

#' Full diagnostic report
#' @export
report_versions <- function() {
  cat("\n=== Climate4R Full Diagnostic Report ===\n\n")
  cat("1. Checking Installed Versions...\n")
  versions_ok <- check_installed_versions()
  cat("\n2. Checking Imports vs Remotes...\n")
  remotes_ok <- check_remotes_versions()
  cat("\n3. Listing Installed Components...\n")
  show_installed_versions()
  cat("\n=== End of Report ===\n")
  invisible(versions_ok && remotes_ok)
}
