# R/session_info.R

#' Climate4R Session Information
#'
#' Lists the versions of the core Climate4R component packages that are required
#' and those currently installed. This function reads the required versions
#' dynamically from the DESCRIPTION file.
#'
#' @return Invisibly returns a named vector of installed versions.
#' @export
climate4R_session_info <- function() {
  required_versions <- .parse_imports_versions()
  
  installed_info <- sapply(names(required_versions), function(pkg) {
    if (requireNamespace(pkg, quietly = TRUE)) {
      as.character(packageVersion(pkg))
    } else {
      "Not Installed"
    }
  }, USE.NAMES = TRUE)
  
  cat("Climate4R Components Version Information:\n")
  for (pkg in names(installed_info)) {
    cat(sprintf("- %s: Installed %s | Required %s\n",
                pkg, installed_info[pkg], required_versions[[pkg]]))
  }
  
  invisible(installed_info)
}
