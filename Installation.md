# Manjaro Installation

## Install firewall

```bash
    sudo systemctl enable ufw.service
```

Enable firewall.

```bash
    sudo ufw enable
```

This enables the Firewall with the default options. To check those options.

```bash
    sudo ufw status verbose
```

## .local/bin

Make sure ``$HOME/.local/bin` exists.

## Installing scripts

Copy the ``shell_funcs.sh`` and ``wipe`` scripts to the ``~/.local/bin`` folder.

Set the execute permissions.

```bash
    chmod 774 ~/.local/bin/shell_funcs.sh
    chmod 774 ~/.local/bin/wipe
```

Run this command to run the ``shell_funcs.sh`` script.

```bash
    echo 'source ~/.local/bin/shell_funcs.sh' >> ~/.zshrc
```

This adds.

> source ~/.local/bin/shell_funcs.sh

to the ``.zshrc`` file.

**Note:** I couldn't get this script file working in Manjaro. To get around this you have to insert the script functions into your current shell. Source does that.

## Install Cargo

Using Rustup (Recommended)

This method is preferred for developers who want to manage multiple toolchains or stay on the latest version. 

Install/Update via curl:

```bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Activate the environment:

```bash
    source "$HOME/.cargo/env"
```

Verify installation:

```bash
    cargo --version
```

### Issue

I want to install ``eza`` and I got error messages. I fixed these with the following commands.

Ensure your system is fully updated.

```bash
    sudo pacman -Syu
```

Install essential build tools, including a C compiler and ``pkg-config``.

```bash
    sudo pacman -S base-devel pkg-config
```

Update the Rust Toolchain.

```bash
    rustup update
```

Clean and Rebuild.

```bash
    cargo clean
```

Now you are ready to install Rust applications.

## Install eza

eza is a coloured replacement for ``ls``. It seems to have all of the options that ``ls`` has plus a lot of extras. Once again this works on a Windows PC.

Documentation.

The [Eza community Github site](https://github.com/eza-community/eza).

### Installation

```bash
    cargo install eza --locked
```

Add to ``$PATH`` if not already (it should be automatically).

```bash
    which eza
```

## Install xcp

``xcp`` is a modern version of the ``cp`` copy command. It is a lot more user friendly than ``cp``.

Installing ``xcp`` on Manjaro is done through Cargo, Rust's package manager.

You can install xcp with.

```bash
	cargo install xcp
```

Installation Directory: The binary is typically installed in ``~/.cargo/bin/``. Make sure this directory is in your shell's $PATH (the Rust installer usually sets this up automatically).

## Install Docker

To install Docker on Manjaro 25, you primarily use the ``pacman`` package manager through the terminal. The process involves updating your system, installing the Docker package, and then starting and enabling the Docker service.

### Installation Steps

Update your system packages.

```bash
   sudo pacman -Syu
```

Install the docker package from the official Manjaro repositories.

```bash
    sudo pacman -S docker
```

Start and enable the Docker service by starting the Docker daemon and enable it to run automatically on system boot.

Start the service immediately.

```bash
    sudo systemctl start docker.service
```

Enable the service to start on boot.
        
```bash
    sudo systemctl enable docker.service
```

Verify the installation. Check if Docker is running correctly by checking its status.

```bash
    sudo systemctl status docker.service
```

Run a test container (e.g., hello-world).

```bash
    sudo docker run hello-world
```

Apply the new group membership. For the changes to take effect, you must either log out and log back in, or restart your system.

Alternatively, you can apply the changes to your current terminal session immediately using the newgrp command.

```bash
    newgrp docker
```

Verify the fix.

After logging back in or running ``newgrp docker``, you can verify that your user is in the docker group by running the ``groups`` command.

```bash
    groups
```

### Manage Docker as a non-root user
    
By default, you must use ``sudo`` to run Docker commands. To run Docker without ``sudo``, you need to add your user account to the docker group.

```bash
    sudo usermod -aG docker $USER
```

For this change to take effect, you may need to log out and log back in (or restart your system).

After logging back in, you can verify by running the test container without ``sudo``.

```bash
    docker run hello-world
```

### Installing Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It is often installed as a plugin alongside Docker Engine. 

To install the Docker Compose plugin via pacman.

```bash
    sudo pacman -S docker-compose
```

Test Docker-Compose is installed.

```bash
    docker compose version
```
