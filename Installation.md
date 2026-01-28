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

(Eza community Github site)[https://github.com/eza-community/eza].

### Installation

```bash
    cargo install eza --locked
```

Add to ``$PATH`` if not already (it should be automatically).

```bash
    which eza
```

## Install xcp
