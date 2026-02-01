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

## Using pamac

``pamac`` is the Pamac Graphical Interface ("Add/Remove Software").

There are a number of software packages that you can use by enabling the AUR:

Open the Add/Remove Software application (Pamac) from your application menu.

Click the three-dot menu icon (☰) in the upper right corner and select Preferences.

Go to the AUR tab and toggle the switch to Enable AUR support.

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

## Install Visual Studio Code

You can use the command line interface of Pamac to install the visual-studio-code-bin package from the AUR.

Update your system packages.

```bash
   sudo pacman -Syu
```

Install:

```bash
    pamac build visual-studio-code-bin
```

Synchronise:

> Github account: alanrob17

## Install unrar

Update your system packages.

```bash
   sudo pacman -Syu
```

Install:

```bash
    sudo pacman -S unrar
```

**Note:** it doesn't look like you can install ``rar``. ``7zip`` is installed on Manjaro.

## Install .Net Core

```bash
    sudo pacman -S dotnet-sdk aspnet-runtime
```

The ``aspnet-runtime`` is optional but recommended if you plan to work with web applications.

Create an environment variable file so your system can locate the dotnet installation.

Open a new file /etc/profile.d/dotnet.sh using a text editor (e.g., nano or vim) with superuser privileges:

```bash
    sudo nano /etc/profile.d/dotnet.sh
```
    
Add the following lines to the file:

```bash
export DOTNET_ROOT=/usr/share/dotnet
export MSBuildSDKsPath=$DOTNET_ROOT/sdk/$(${DOTNET_ROOT}/dotnet --version)/Sdks
export PATH=${PATH}:${DOTNET_ROOT}
```

Reboot your system or re-login for the environment variables to take effect.

Verify the installation by checking the installed SDKs:

```bash
    dotnet --list-sdks
```

### Extra setup

Installed an ASP.NET Core HTTPS development certificate.

To trust the certificate:

```bash
    dotnet dev-certs https --trust
```

**Note:** Trusting the HTTPS development certificate was requested. Trust is per-user and may require additional configuration. See https://aka.ms/dev-certs-trust for more information.

Verifying workloads:

```bash
    sudo dotnet workload update
```

## Install snap

Install snapd:

```bash
    sudo pacman -S snapd
```

Enable Snap: Enable the socket and link it:

```bash
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
```

**Note:** after this is done you need to reboot.

Check your path and make sure this is included:

```bash
    /var/lib/snapd/snap/bin 
```

## Install NordVPN

I can only use NordVPN as a snap package.

```bash
    sudo snap install nordvpn
```
    
Configure Permissions: Add your user to the nordvpn group to avoid permission errors:
    
```bash
    sudo usermod -aG nordvpn $USER
```

**Note:** Restart your computer to apply group changes.

As we are using snap we have to run some more settings:

```bash
sudo snap connect nordvpn:system-observe
sudo snap connect nordvpn:hardware-observe
sudo snap connect nordvpn:network-control
sudo snap connect nordvpn:network-observe
sudo snap connect nordvpn:firewall-control
sudo snap connect nordvpn:login-session-observe
```

Reboot again.

### Login to NordVPN

You have to create a token on the NordVPN website:

```bash
nordvpn login --token e9f2ab396bdec347ee8e839bb37085f39708b31797c6d9129f99e7ad4f36cd24
```

Now you can connect:

```bash
    nordvpn connect Australia Sydney
```

## Install Chrome browser

```bash
    sudo pamac build google-chrome
```

## Install Brave browser

```bash
    sudo pamac install brave-browser
```

## Install vnstat

```bash
    sudo pacman -Syu vnstat
```

Enable and Start the vnStat Daemon:

``vnstat`` runs as a background service (daemon) to collect data. You must enable it to start automatically on boot and start it immediately:

```bash
    sudo systemctl enable --now vnstat
```

Verify the Installation:

Check that the daemon is running correctly:

```bash
    sudo systemctl status vnstat
```

## Installing Rust utilities

There are a number of Rust utilities that can be used in Linux or Windows. I will install and document these applications.

These are documented at Github - [Modern Unix utilities](https://github.com/ibraheemdev/modern-unix).

### Bat

``BatCat`` is a replacement for ``Cat`` with an impressive coloured output.

Installation: 

Use pamac to install ``BatCat``.

#### Create an alias

We can create aliases and add it to .zsh_aliases.

```bash
    alias bc='batcat'
    alias cat='batcat'
```

### fd

The ``fd`` command is a file system utility, serving as a modern, faster, and more user-friendly alternative to the traditional ``find`` command in Linux. It offers a simpler syntax and sensible defaults for common use cases.

Installation

```bash
    sudo pacman -S fd
```

#### Usage

```bash
    fd PATTERN
```

``fd`` is supposedly case insensitive. I have to use ``-i`` to force it to be case insensitive.

```bash
    fd wipe
```

Returns.

> Documents/Linux-Mint-22/wipe      
> Documents/Manjaro-25/wipe     
> Downloads/wipe

Search in a specific directory.

```bash
    fd bypass-brave.txt Documents/
```

Note: you can use ``-i`` for case insensitive searches.

Searching for multiple files with the same extension.

```bash
    fd -g '*.epub'
```

Returns.

> Documents/Linux-Mint-22/Dot-Net-in-Linux.md       
> Documents/Linux-Mint-22/Software-for-Linux-Mint-22.md     
> ...       
> Downloads/asp/bypass-paywalls-chrome-clean-master/README.md       
> Downloads/asp/bypass-paywalls-chrome-clean-master/allowlist/README.md

**Note:** ``-g`` is for file globbing and this allows you to do wildcard searches. You have to enclose the extension in quotes.

Only search 2 directories deep:

```bash
    fd -gd3 '*.md'
```

Returns.

> Documents/Linux-Mint-22/Dot-Net-in-Linux.md       
> Documents/Linux-Mint-22/Software-for-Linux-Mint-22.md     
> ...

Search for files with an extension:

```bash
    fd -e sh
```

Returns.

> Documents/Linux-Mint-22/colours.sh        
> Documents/Linux-Mint-22/gc.sh     
> Documents/Linux-Mint-22/shell_funcs.sh        
> Downloads/shell_funcs.sh

To list all files in a specific directory, use the wild card symbol ``.`` as the search pattern:

```bash
    fd . Documents/
```

Returns everything in the Documents directory.

There are a huge number options with the ``fd`` command.

### tldr

The Linux ``tldr`` (Too Long; Didn't Read) application is a command-line tool providing simplified, community-driven cheat sheets for common Linux/Unix commands, acting as an easy-to-read alternative to lengthy man pages by focusing on practical examples. It helps users quickly understand commands like ``ls`` or ``tar`` with concise, ready-to-use examples, making it great for beginners and experienced users who need a fast reminder.

Installation:

```bash
    sudo pacman -S tldr
```

Once you have installed ``tldr`` you need to update the local cache of tldr pages:

```bash
    tldr -u|--update
```

#### Usage

Print the ``tldr`` page for a specific command:

```bash
   tldr command
```

Print the tldr page for a specific subcommand:

```bash
   tldr command subcommand
```

Print the tldr page for a command from a specific platform:

```bash
   tldr [-p|--platform] android|cisco-ios|common|dos|freebsd|linux|netbsd|openbsd|osx|sunos|windows command
```

List all pages for the current platform and common:

```bash
   tldr -l|--list
```

### zoxide

``zoxide`` is an alternative to the cd command, offering faster performance and smarter navigation capabilities. Like the tools mentioned below, much of the power of ``zoxide`` is in its directory ranking based on your usage. Its ranking algorithm can quickly match partial paths, even single search terms, with one of your most used directories.

Installation:

```bash
    sudo pacman -S zoxide
```
	
Have your shell initialize zoxide with each shell session. You can do so by adding the following line to the end of your ~/.zshrc file.

File: ~/.zshrc

```bash
	#...
	eval "$(zoxide init zsh)"
```

### fzf

```bash
    sudo pacman -S fzf
```

``zsh`` automatically installs the key bindings.

#### Key bindings

Once shell integration is set up, the following key bindings are available in your terminal.

**Ctrl+T**: Fuzzy find all files and subdirectories of the working directory and insert the selected items onto the command line.

**Ctrl+R**: Search through your shell command history using fuzzy matching. Pressing Ctrl+R again toggles sorting by relevance.

**Alt+C**: Fuzzy find all subdirectories and cd (change directory) into the selected one.

Installing Fuzzy Finder in the ``.zsh`` shell:

```bash
    source <(fzf --zsh)
```
