# Climate4R 
![Version](https://img.shields.io/badge/version-2.6.2-blue) ![Conda](https://img.shields.io/conda/vn/conda-forge/r-climate4r) ![GitHub release](https://img.shields.io/github/v/release/SantanderMetGroup/climate4R) ![License](https://img.shields.io/badge/license-GPL--3-blue)

**Climate4R** is an R metapackage designed to bundle and install all core components of the Climate4R ecosystem in one step.  
Its goal is to provide a reproducible, scalable, and modular framework for climate data management, analysis, downscaling, and visualization, especially for NetCDF datasets.

## 📦 Installation

We strongly recommend installing Climate4R through the **conda-forge** channel:

```bash
conda install -c conda-forge r-climate4r
```

Climate4R is a metapackage with many R dependencies and, importantly, external libraries and system applications (e.g., NetCDF libraries). Using **conda-forge** guarantees that all R packages and system dependencies are resolved and installed automatically, avoiding version conflicts or compilation errors.

### Example: Conda environment creation

```bash
conda create -n climate4r_env -c conda-forge r-climate4r
```

This will create a new environment named `climate4r_env` with all necessary R packages and external libraries.

> **Note:** Climate4R itself does not provide user-facing functions—it exists solely to install and pin the versions of all Climate4R component packages.

---

## ✅ Included Packages (Climate4R 2.6.2)

| Package              | Version | Description                                          |
|:---------------------|:--------|:---------------------------------------------------|
| loadeR              | 1.8.1   | Load and subset climate data from NetCDF files      |
| transformeR         | 2.2.2   | Transform, aggregate, and manipulate climate data   |
| downscaleR         | 3.3.4   | Statistical downscaling of climate data             |
| visualizeR         | 1.6.4   | Advanced visualization tools for climate data      |
| loadeR.java        | 1.1.1   | Java-based NetCDF backend for loadeR               |
| loadeR.2nc         | 0.1.3   | Convert loadeR outputs to NetCDF format            |
| convertR           | 0.2.1   | Unit and scale conversions for climate data        |
| climate4R.UDG      | 0.2.6   | Interface with the UDG climate data repository     |
| loadeR.ECOMS       | 1.4.8   | Access ECOMS databases                             |
| downscaleR.keras   | 1.1.1   | Deep learning-based downscaling using Keras        |
| geoprocessoR       | 0.2.2   | Geospatial processing utilities                    |
| climate4R.climdex  | 0.2.3   | Calculate climate indices following Climdex       |
| climate4R.indices  | 0.3.1   | Compute additional climate indices                 |
| fireDanger         | 1.1.0   | Fire danger indices and modeling                  |
| VALUE             | 2.2.4   | Validation of climate data and downscaling methods|
| climate4R.value    | 1.0.2   | Integration with VALUE framework                  |
| mopa              | 1.1.2   | Modeling species distribution under climate change |
| drought4R         | 0.3.1   | Drought analysis and monitoring tools             |
| climate4R.datasets | 0.0.1   | Example datasets for Climate4R tutorials          |
| calibratoR        | 0.2.0   | Calibration tools for climate models              |
| climate4R.hub     | 0.0.1   | Experimental hub interface                        |

---

## 🔍 Diagnostics

```r
library(climate4R)
climate4R_check_versions()             # Check installed versions
climate4R_check_remotes_consistency() # Check Imports vs Remotes
climate4R_session_info()              # Show installed/required versions
climate4R_report()                    # Full diagnostic report
```

---

## 🧪 Testing

Below is an example of expected test output to give users confidence:

```
> climate4R::report_versions()

=== Climate4R Full Diagnostic Report ===

1. Checking Installed Versions...
Climate4R version check passed.

2. Checking Imports vs Remotes...
Climate4R remotes consistency check passed.

3. Listing Installed Components...
Climate4R Components Version Information:
- loadeR: Installed 1.8.1 | Required 1.8.1
- transformeR: Installed 2.2.2 | Required 2.2.2
- downscaleR: Installed 3.3.4 | Required 3.3.4
- visualizeR: Installed 1.6.4 | Required 1.6.4
- loadeR.java: Installed 1.1.1 | Required 1.1.1
- loadeR.2nc: Installed 0.1.3 | Required 0.1.3
- convertR: Installed 0.2.1 | Required 0.2.1
- climate4R.UDG: Installed 0.2.6 | Required 0.2.6
- loadeR.ECOMS: Installed 1.4.8 | Required 1.4.8
- downscaleR.keras: Installed 1.1.1 | Required 1.1.1
- geoprocessoR: Installed 0.2.2 | Required 0.2.2
- climate4R.climdex: Installed 0.2.3 | Required 0.2.3
- climate4R.indices: Installed 0.3.1 | Required 0.3.1
- fireDanger: Installed 1.1.0 | Required 1.1.0
- VALUE: Installed 2.2.4 | Required 2.2.4
- climate4R.value: Installed 1.0.2 | Required 1.0.2
- mopa: Installed 1.1.2 | Required 1.1.2
- drought4R: Installed 0.3.1 | Required 0.3.1
- climate4R.datasets: Installed 0.0.1 | Required 0.0.1
- calibratoR: Installed 0.2.0 | Required 0.2.0
- climate4R.hub: Installed 0.0.1 | Required 0.0.1

=== End of Report ===
```

Optionally, you can tests using `devtools`.

```r
library(devtools)
devtools::test()
```

---

## ⚠️ Best Practices

- Use the validated versions provided in the metapackage.
- Avoid mixing development versions (`@devel`) unless necessary.
- Run `climate4R_report()` regularly to monitor your environment.

---

### Alternative Installation (GitHub)

```r
install.packages("remotes")
remotes::install_github("SantanderMetGroup/climate4R")
```

> **Note:** Recommended mainly for development and testing.

## 📜 License

Climate4R is licensed under **GNU General Public License v3.0 (GPL-3)**.

## 📚 References

- [Climate4R GitHub](https://github.com/SantanderMetGroup/climate4R)
- [NetCDF-Java](https://www.unidata.ucar.edu/software/netcdf-java/)
- [R Project](https://www.r-project.org/)
- [Publication: Climate4R Framework Paper](https://doi.org/10.1002/joc.5280)
- [Example Use Case: Seasonal Forecasting with Climate4R](https://santandermetgroup.github.io/climate4R_tutorials/)
