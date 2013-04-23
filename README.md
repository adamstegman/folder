# Image Host

A very simple, very insecure image host for internal usage.

## Usage

Upload an image at `/images/new` or using the REST API.
Max image size of 10 MB? Store using flat files and let nginx throw those at the user agent.

View the image at `/images/:id`.
Query parameters can resize the image: `/images/:id?width=350`.
TODO: document all parameters

## Setup

Download the source code and run the installer.

    cd image_host
    script/install

This will install Chef and run the embedded cookbook to install the application to the default location with default configuration.
