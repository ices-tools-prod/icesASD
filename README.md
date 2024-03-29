[![runiverse-name example
badge](https://ices-tools-prod.r-universe.dev/badges/:name)](https://ices-tools-prod.r-universe.dev/builds)
[![runiverse-package example badge for gert
package](https://ices-tools-prod.r-universe.dev/badges/icesASD)](https://ices-tools-prod.r-universe.dev/icesASD)
[![cran-badge example for gert
package](http://www.r-pkg.org/badges/version/icesASD)](https://CRAN.R-project.org/package=icesASD)
[![License](https://img.shields.io/badge/license-GPL%20(%3E%3D%202)-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

[<img align="right" alt="ICES Logo" width="17%" height="17%" src="http://ices.dk/_layouts/15/1033/images/icesimg/iceslogo.png">](http://ices.dk)

### icesASD

icesASD provides R functions that access the [web
services](http://sg.ices.dk/webservices.aspx) of the
[ICES](http://ices.dk) [Advice and Scenarios](http://sg.ices.dk)
database.

icesASD is implemented as an [R](https://www.r-project.org) package and
(will be) available on
[CRAN](https://cran.r-project.org/package=icesASD).

### Installation

icesASD can be installed from CRAN using the `install.packages` command:

``` r
install.packages("icesASD")
```

or using:

``` r
install.packages('icesASD', repos = 'https://ices-tools-prod.r-universe.dev')
```

### Usage

For a summary of the package:

``` r
library(icesASD)
?icesASD
```

### References

ICES Advice and Scenarios database: <http://sg.ices.dk>

ICES Advice and Scenarios database web services:
<http://sg.ices.dk/webservices.aspx>

### Development

icesASD is developed openly on
[GitHub](https://github.com/ices-tools-prod/icesASD).

Feel free to open an
[issue](https://github.com/ices-tools-prod/icesASD/issues) there if you
encounter problems or have suggestions for future versions.

The current development version can be installed using:

``` r
install.packages(
  "icesASD", 
  repos = c('https://ices-tools-prod.r-universe.dev', 'https://cloud.r-project.org')
)
```
