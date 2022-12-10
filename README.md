# WordPress Docker - A containerized Wordpress Development environment

## Who needs this?
Anyone who builds custom themes or plugins and want a quick way to spin up a new custom Wordpress instance for development.

## Requirements
- [Docker](https://www.docker.com/) (Latest Version recommended)
- MacOS, Linux

If running Windows consider using WSL https://docs.docker.com/desktop/windows/wsl/ so that you can run the shell scripts included in this repository.

## Initialization
Run the init script
```
./init.sh
```
This script will:
1. Create a wp-content directory in this repository's parent directory
2. Create a symlink replacing the `wp-content` directory inside the container with the contents of the newly created `wp-content` directory

## Add your plugins/themes
Since the new wp-content directory is empty, you will need to add some initial content to it. The easiest way to do this is to pull down the latest WordPress installation from the [WordPress GitHub](https://github.com/WordPress/WordPress) and copy over the contents of the `wp-content` directory into your new `wp-content` directory.

## Running the Container
Once you have initialized your project and added your content, run the following command to start your WordPress instance.
```
./start.sh
```

## Install your WordPress instance
Now you can visit http://localhost:8080 and follow the WordPress installation steps. Any edits made to your new wp-content directory will instantly read by the container since we are using using a Docker persistent volume for the wp-content directory.

Additionally any changes in the database will persist since the MySQL installation is also set up to use a persistent volume for its data storage.
