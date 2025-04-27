# R/zzz.R

# Helper function to parse the Imports field from DESCRIPTION
.parse_imports_versions_full <- function() {
  desc_path <- system.file("DESCRIPTION", package = "climate4R")
  if (desc_path == "") {
    warning("Could not find DESCRIPTION file for climate4R package.")
    return(list())
  }
  
  desc <- read.dcf(desc_path)
  imports_raw <- desc[1, "Imports"]
  
  imports_list <- strsplit(imports_raw, ",")[[1]]
  imports_list <- trimws(imports_list)
  
  versions <- list()
  for (entry in imports_list) {
    matches <- regmatches(entry, regexec("^([a-zA-Z0-9\\.]+)\\s*(\\((.*)\\))?$", entry))[[1]]
    pkg <- matches[2]
    constraint <- matches[4]
    
    if (!is.na(constraint)) {
      constraint <- trimws(constraint)
      operator <- regmatches(constraint, regexpr("^(==|>=|<=|>|<)", constraint))
      version <- gsub("^(==|>=|<=|>|<)\\s*", "", constraint)
      versions[[pkg]] <- list(operator = operator, version = version)
    } else {
      versions[[pkg]] <- list(operator = NULL, version = NULL)
    }
  }
  return(versions)
}

# Helper function to check a single package version
.check_package_version <- function(pkg, requirement) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    warning(sprintf("Required package '%s' is not installed.", pkg))
    return(FALSE)
  }
  
  if (is.null(requirement$operator)) {
    # No version constraint specified, only check installation
    return(TRUE)
  }
  
  installed_version <- as.character(packageVersion(pkg))
  cmp <- utils::compareVersion(installed_version, requirement$version)
  
  condition_met <- switch(requirement$operator,
                           "==" = cmp == 0,
                           ">=" = cmp >= 0,
                           "<=" = cmp <= 0,
                           ">"  = cmp > 0,
                           "<"  = cmp < 0,
                           TRUE)
  
  if (!condition_met) {
    warning(sprintf(
      "Version mismatch for package '%s': installed %s, required %s %s.",
      pkg, installed_version, requirement$operator, requirement$version
    ))
    return(FALSE)
  }
  
  return(TRUE)
}

# Helper to parse the Remotes field from DESCRIPTION
.parse_remotes_versions <- function() {
  desc_path <- system.file("DESCRIPTION", package = "climate4R")
  if (desc_path == "") {
    warning("Could not find DESCRIPTION file for climate4R package.")
    return(list())
  }
  
  desc <- read.dcf(desc_path)
  remotes_raw <- desc[1, "Remotes"]
  
  if (is.na(remotes_raw)) {
    return(list())
  }
  
  remotes_list <- strsplit(remotes_raw, ",")[[1]]
  remotes_list <- trimws(remotes_list)
  
  remotes_versions <- list()
  for (entry in remotes_list) {
    matches <- regmatches(entry, regexec("^([^/@]+)/([^@]+)@(.+)$", entry))[[1]]
    if (length(matches) >= 4) {
      repo_name <- matches[3]
      tag_version <- matches[4]
      remotes_versions[[repo_name]] <- tag_version
    }
  }
  return(remotes_versions)
}

# Function executed automatically when the package is loaded
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Loading Climate4R metapackage...")
  
  required_versions <- .parse_imports_versions_full()
  
  for (pkg in names(required_versions)) {
    .check_package_version(pkg, required_versions[[pkg]])
  }
  
  packageStartupMessage("Climate4R successfully loaded.")
}
