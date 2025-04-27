# Climate4R

**Climate4R** is a modular framework for the management, analysis, and downscaling of climate datasets based on NetCDF files.  
It integrates specialized R packages like `loadeR`, `transformeR`, `downscaleR`, and `visualizeR`.

---

## Installation

Climate4R is not yet available on CRAN. To install the latest validated version from GitHub, use:

```r
install.packages("devtools") # If not already installed
devtools::install_github("SantanderMetGroup/climate4R")
```

This will:
- Download Climate4R.
- Install the required component packages (`loadeR`, `transformeR`, `downscaleR`, `visualizeR`) in specific versions defined by the developers.
- Install these components directly from GitHub, not from CRAN, based on the exact validated tags (e.g., `v1.3.2`, `v1.1.1`, etc.).

> **Important**: Use `devtools::install_github()` or `remotes::install_github()`, because `install.packages()` does not support GitHub sources.

---

## Version Management

Climate4R ensures compatibility and reproducibility by:

- Declaring specific required versions in the `Imports` field of the `DESCRIPTION`.
- Defining where to fetch the correct versions from in the `Remotes` field.
- Checking version consistency at package load time.

If installed versions differ from the expected ones, Climate4R will issue a warning.

---

## Development and Testing

Climate4R includes built-in utilities for diagnostics and testing:

- `climate4R_check_versions()`: Verifies that installed component packages match required versions.
- `climate4R_check_remotes_consistency()`: Checks that `Imports` and `Remotes` are consistent.
- `climate4R_session_info()`: Displays installed vs required versions of all core components.
- `climate4R_report()`: Runs a full diagnostic report combining version checks and session info.

Unit testing is implemented using the `{testthat}` framework. To run all tests:

```r
devtools::test()
```

Tests ensure that:
- Version checks run silently without errors.
- Reports return valid logical results.
- Session information outputs correctly.

---

## How Version Control Works

During installation:
- Climate4R reads the `Imports` and `Remotes` fields.
- Installs specified versions from GitHub repositories.

During loading (`library(climate4R)`):
- Climate4R automatically checks installed versions.
- Emits warnings if discrepancies are detected.

---

## Warning About Development Versions

If you manually install a *development* version of any component (e.g., `loadeR@development`), it may cause compatibility issues.

Climate4R does not prevent using them but issues a warning upon loading.

For maximum stability and reproducibility, it is strongly recommended to use only the validated versions.

---

## Checking Your Climate4R Environment

You can verify your installed versions by running:

```r
climate4R_session_info()
```

Or generate a full report:

```r
climate4R_report()
```

---

## License

Climate4R is distributed under the **GNU General Public License v3.0 (GPL-3)**.

---

## References

- [Climate4R GitHub Repository](https://github.com/SantanderMetGroup/climate4R)
- [NetCDF-Java library](https://www.unidata.ucar.edu/software/netcdf-java/)
- [R Project for Statistical Computing](https://www.r-project.org/)
