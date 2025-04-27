# Climate4R News

## Version 0.1.0 (Development)

- Initial public version of Climate4R metapackage.
- Provides a modular framework for loading, processing, analyzing, and visualizing climate datasets in R.
- Integrates core packages: `loadeR`, `transformeR`, `downscaleR`, and `visualizeR`.
- Implements automated version checks against `Imports` using `climate4R_check_versions()`.
- Adds consistency check between `Imports` and `Remotes` with `climate4R_check_remotes_consistency()`.
- Provides a session information utility via `climate4R_session_info()`.
- Introduces `climate4R_report()` for generating full diagnostic reports.
- Ensures dynamic parsing of `DESCRIPTION` to maintain package integrity without duplication of version information.
- Licensed under GNU GPL v3.