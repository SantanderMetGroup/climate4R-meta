# R/report.R

#' Climate4R Full Diagnostic Report
#'
#' Generates a full report checking version compatibility, remotes consistency,
#' and listing installed component versions for Climate4R.
#'
#' @return Invisibly returns TRUE if no major inconsistencies are found; otherwise FALSE.
#' @export
climate4R_report <- function() {
  cat("\n=== Climate4R Full Diagnostic Report ===\n\n")
  
  cat("1. Checking Installed Versions Against DESCRIPTION...\n")
  versions_ok <- climate4R_check_versions()
  
  cat("\n2. Checking Consistency Between Imports and Remotes...\n")
  remotes_ok <- climate4R_check_remotes_consistency()
  
  cat("\n3. Listing Installed Component Versions...\n")
  climate4R_session_info()
  
  cat("\n=== End of Report ===\n")
  
  invisible(versions_ok && remotes_ok)
}
