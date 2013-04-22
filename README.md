# Image Host

A very simple, very insecure image host for internal usage.

## Usage

Upload an image at `/images/new` or using the REST API. Max image size of 10 MB?

View the image at `/images/:id`. Query parameters can resize the image: `/images/:id?width=350`. TODO: document all parameters

## Setup

TODO: apache + passenger, or play with nginx
