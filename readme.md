# MacOS Buildout

Repository is based on: [BLOG: Rapid Complete Install / Reinstall OS X Like a Champ in Three-ish Hours](http://www.andrewconnell.com/blog/rapid-complete-install-reinstall-os-x-like-a-champ-in-three-ish-hours)

## Before Paving, document current config

Do the following before paving the partition. This is to get the way I have things configured in the dock & menu bar back the way I want them.

- Set up timestamped backup folder, **{{PRIVATE_BACKUP}}**, Drive (or similar) to copy things
- Screenshot all installed apps
- copy the following => **{{PRIVATE_BACKUP}}**
  > **NOTE:** many of the hidden files & folders are copied as "dot-files"

  - `~/.bash_history`
  - `~/.bash_profile`
  - `~/.gitconfig`
  - `~/.ssh`
  - `~/.zshrc`
  - `~/Desktop`
  - `~/Downloads`
  - `~/Documents`
  - `~/Movies`
  - *review other folders in the root*
- Dev
  - Dump list of all repos in `~/repos` => **{{PRIVATE_BACKUP}}**
- Visual Studio Code
  - refresh installed extensions install list: **[./scripts/vscode-ext-install.sh](./scripts/vscode-ext-install.sh)**

      ```bash
      $ code --list-extensions
      ```

  - backup snippets & user settings to **[./AppSettings/VisualStudioCode](./AppSettings/VisualStudioCode)**
    - user settings: `~/Library/Application Support/Code/User`

- Spectactle
    - Shortcuts: `~/Library/Application Support/Spectacle`

- qBitorrent/Karabiner configs:
    - `~/.config `

### MacOS & System

- have a current Apple TimeMachine backup job finished
- screenshots of Finder settings

    ![](images/macOS-Finder-Settings-General.png)

    ![](images/macOS-Finder-Settings-Preferences.png)

    ![](images/macOS-Finder-Settings-Sidebar.png)

- screenshot MacOS dock

    ![](images/macOS-Dock.png)

- screenshot of MacOS Menu Bar

    ![](images/macOS-MenuBar.png)


- export list of VMs => **{{PRIVATE_BACKUP}}**
- Mac App Store apps
- refresh list installed MacOS apps: **[./scripts/macos-install.sh](./scripts/macos-install.sh)**

    ```bash
    $ mas list
    ```

## Pave partition

1. restart with COMMAND+R
1. when apple logo comes up... delete partition, NOT tiny partition (2nd listed)
1. install MacOS via internet

## Install apps

The following installs & configuration should be done to setup automated installs.

### Homebrew & Homebrew Cask

Install [Homebrew](http://brew.sh/) for automated installs & updates.

```bash
curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/homebrew-install.sh | sh
```

### Install apps via Homebrew: `homebrew-install-apps.sh`

Install apps using Homebrew.

# TODO: 
- CHANGE GITHUB LINKS TO MY OWN
- Conda install
- Screenshot Brew list


> **NOTE**: Monitor the terminal for password prompts & errors/warnings.

```bash
curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/homebrew-install-apps.sh | sh
```

### Install Mac App Store apps: `macos-install.sh`

Install apps from the Apple App Store.

```bash
curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/macos-install.sh | sh
```

### Manual Installs

- MANUAL INSTALLS HERE

## Configure apps

Three step process:

1. Get Google Chrome syncing to get access to backups, settings, licenses & passwords
1. Configure command prompt
1. Login, license, install, & configure remaining apps

### Configure core apps to acquire backups, licenses & passwords

- login to the following apps
  - Google Chrome/Drive
    - *do this first to get licenses*
- Visual Studio Code
  - install extensions collected before pave:

      ```bash
      curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/vscode-ext-install.sh | sh
      ```

  - copy snippets & settings:
    - from **[./AppSettings/VisualStudioCode](./AppSettings/VisualStudioCode)**
    - to `~/Library/Application Support/Code/User`
  - apply licenses to extensions Quokka & Wallaby

### Setup command prompt (iTerm)

Install ZSH, Oh My ZSH, iTerm & copy fonts & themes:

```bash
curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/cmdprompt-install.sh | sh
```

- iTerm
  - import settings from **[./AppSettings/iTerm](./AppSettings/iTerm)**
  - apply custom **robbyrussel** theme
    - update `~/.zshrc` to specify the theme used: `ZSH_THEME="robbyrussell"` (I think that this is the default..)
  - setup SSH keys
    - copy backed up `./.ssh` keys from **{{PRIVATE_BACKUP}}** => `./.ssh`
    - configure SSH keys

        ```bash
        # add key to SSH agent
        ssh-add ~/.ssh/id_rsa

        # add to keychain
        ssh-add -K

        # configure 'config' folder permissions
        sudo chmod 600 ~/.ssh/id_rsa
        ```

### Configure Installed Apps


- iStat Settings
  - license & restore settings: [./AppSettings/iStat Menus Settings.ismp](./AppSettings/iStat%20Menus%20Settings.ismp)
- Menubar layout:

    ![](./images/macOS-MenuBar.png)

- NordVPN
- Slack

## Additional downloads & installs Install My Personal Apps: `scripted-installs.sh`

```bash
curl -L https://raw.githubusercontent.com/andrewconnell/osx-install/master/scripts/scripted-installs.sh | sh
```

- Creative Cloud installs (currently the only item in list above)
  - Acrobat DC
  - Lightroom CC
  - Photoshop 2020


## Post installation & configuration checks

### Update Homebrew, Homebrew Cask & purge installs

```bash
brew doctor
brew update
brew cleanup
brew cask cleanup
```

### Setup git

> NOTE: This might already be done by copying the hidden **~./.gitconfig**.

```bash
git config --global user.name "EliZucker"
git config --global user.email "eli_zucker@brown.edu"
git config --global credential.helper osxkeychain
```

### MacOS Tweaks

- System Preferences

  - Dock
    - settings: **System Preferences > Dock**

        ![](./images/macOS-SysPrefs-Dock.png)

    - update dock to the backup image

        ![](./images/macOS-Dock.png)

  - General

      ![](./images/macOS-SysPrefs-General.png)

  - Keyboard

      ![](./images/macOS-SysPrefs-Keyboard.png)


  - Mission Control

      ![](./images/macOS-SysPrefs-MissionControll.png)

  - Internet Accounts

      - Everything but mail synced

  - Printers
    - install / add printers

### Data Restore

- Clone select repositories from github => `~/GitHub`

### Setup TimeMachine Backups

Run first backups.

## Ongoing... HOWTO Keep Things Updated

to keep Homebrew installed things update, do this:

  ```bash
  brew update           # download app updated formulas
  brew outdated         # what's old?
  brew upgrade          # upgrade everything locally
  # list all brew casks installed & their versions
  brew cask outdated
  brew cask upgrade
  # cleanup everything
  brew cleanup
  ```

update MacOS apps:

  ```bash
  mas outdated    # what's old
  mas upgrade     # upgrade everything
  ```

update MacOS: [ref](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/softwareupdate.8.html)

  ```bash
  softwareupdate --list
  # install things based on the name returned using
  sudo softwareupdate --install [name listed]
  ```
