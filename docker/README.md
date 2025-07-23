# Rethinking RStudio Docker Image

This Docker image provides a pre-configured RStudio environment with the `rethinking` package and all its dependencies installed.

## What's Included

- **Base Image**: `rocker/rstudio:latest` (RStudio Server)
- **R Packages**:
  - `rethinking` - Statistical Rethinking package by Richard McElreath
  - `cmdstanr` - R interface to CmdStan
  - `coda` - Output analysis and diagnostics for MCMC
  - `mvtnorm` - Multivariate normal and t distributions
  - `devtools` - Tools for package development
  - `loo` - Leave-one-out cross-validation and WAIC
  - `dagitty` - Graphical analysis of structural causal models
  - `shape` - Functions for plotting graphical shapes

## Usage

### Pull the Image

```bash
docker pull patrickrobotham/rethinking-rstudio:latest
```

### Run the Container

```bash
docker run -d \
  -p 8787:8787 \
  -e PASSWORD=your_password \
  -v $(pwd):/home/rstudio/work \
  --name rethinking-rstudio \
  patrickrobotham/rethinking-rstudio:latest
```

### Access RStudio

1. Open your web browser
2. Navigate to `http://localhost:8787`
3. Login with:
   - Username: `rstudio`
   - Password: `your_password` (or whatever you set in the PASSWORD environment variable)

## Environment Variables

- `PASSWORD`: Set the password for the rstudio user (required)
- `ROOT`: Set to `TRUE` to run as root user (optional)

## Volume Mounting

The example above mounts the current directory to `/home/rstudio/work` inside the container. You can modify the volume mount to point to any directory on your system.

## Building from Source

If you want to build the image locally:

```bash
git clone <repository-url>
cd StatisticalRethinking
docker build -f docker/rethinking-rstudio.Dockerfile -t rethinking-rstudio .
```

## Version History

- `v1.0.0`: Initial release with rethinking package and dependencies

## License

This Docker image is based on the rocker/rstudio image and includes the rethinking package by Richard McElreath. 