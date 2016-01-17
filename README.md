# devstrap - Developer eXperience oriented
Devstrap are bootstraps processes to deploy a development environment.

Devstrap is compatible with following platforms
- Windows 7 and further
- Linux (Ubuntu 14.04 LTS and further is only supported for the moment)
- OSX 10.11 and further

## Background
The goals of **devstrap** are following
- deploy full developpment stacks / frameworks / libraries / tools on your development platform
- install a helper tool named 'ra' (Rapid Administration) to ease the use of your development platform
- enable the same developper experience on each platform

## Prerequisites
To deploy **devstrap**, following prerequisites are required.
- Windows
  - Windows 7 and further installed
  - If you're running on Windows 7, [install PowerShell 3.0](https://www.microsoft.com/en-us/download/details.aspx?id=34595). If you're running on newer version of Windows, skip this step.
  - Update execution policy (Warning: Don't do that on your servers, it's insecure), open a Powershell terminal and launch ```set-executionpolicy unrestricted -s cu```
- Linux
  - Ubuntu 14.04 LTS x64 (or further) installed
- Mac
  - Mac OSX 10.11 (or further) installed

## Installation
Installation consists on deploying the core environment for supporting **ra** command.
- Windows
  - Open Powershell terminal and launch

```$ iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/reyerstudio/devstrap/master/straps/windows/core.ps1')```
- Linux
  - Open a terminal and launch

```$ bash <(curl -sL 'https://raw.githubusercontent.com/reyerstudio/devstrap/master/straps/unix/core.sh')```
- Mac
  - Open a terminal and launch

```$ bash <(curl -sL 'https://raw.githubusercontent.com/reyerstudio/devstrap/master/straps/unix/core.sh')```

## Usage
Devstrap processes are maanged by **ra** command line.
Open a terminal, launch ```ra```
```
usage: ra <command> [<args]
Some useful commands are:

help     Show help for a command
strap    Strapping 'target' environment
sync     Updating scoop and configured buckets
unstrap  Unstrapping 'target' environment
upgrade  Upgrade apps
version  Get ra version


type 'ra help <command>' to get help for a specific command
```

## References
**devstrap** processes are based on
- [Scoop](http://scoop.sh/) on Windows
- [Linuxbrew](http://brew.sh/linuxbrew/) on Linux
- [Homebrew](http://brew.sh/) on Mac
