# Installation

## Installing on Windows® and Linux
The easiest way to install this package and required dependencies for Google Cloud Product Interfaces is to clone the top-level repository using:
```
git clone --recursive https://github.com/mathworks-ref-arch/mathworks-gcp-support.git
```

### Build the google-cloud SDK for Java components
The MATLAB code uses the Google Cloud client library for Java and can be built using:
```bash
cd matlab-gcp-common/Software/Java
mvn clean package
```

Once the SDK within `matlab-gcp-common` is built, change directory to  ```mathworks-gcp-support/Software/MATLAB``` folder and use the ```startup.m``` function to initialize the interface for all Google Cloud interfaces within this package.
```bash
cd mathworks-gcp-support/Software/MATLAB
startup
```

[//]: #  (Copyright 2020 The MathWorks, Inc.)
