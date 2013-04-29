# Folder

A very simple, very insecure image and file host for internal usage.

## Usage

Upload an image at `/images/new` or using the REST API.
Max image size of 10 MB? Store using flat files and let nginx throw those at the user agent.

View the image at `/images/:id`.
Query parameters can resize the image: `/images/:id?width=350`.
TODO: document all parameters

## Setup

Download the source code and run the installer.

    cd folder
    script/install

This will install Chef and run the embedded cookbook to install the application to the default location with default configuration.

## Development

Make sure to update the cookbook in `config/chef` when you alter configuration or introduce a non-gem dependency.

Postgres is the default database adapter, so install it and `rake db:setup` before running the server.

Change into the `config/chef` directory and `vagrant up` to set up the application in a Vagrant VM.
The site will be available at [http://localhost:8080/](http://localhost:8080/).
