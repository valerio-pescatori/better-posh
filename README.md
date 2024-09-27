# better-posh
This repo contains my custom powershell setup to mimick the look and feel of a (customized) zsh terminal.

## Desired features:
  1. **Dark theme** in Windows Terminal
  1. **Oh-My-Posh** with git plugin + catppuccin theme
  1. **PsReadLine** module, for history suggestion
  1. **Git-aliases** module, for zsh-like git aliases 
  1. **zoxide**, aliased to 'cd' for better navigation

## Dark theme in Windows Terminal
That's easy, just open the settings (`Ctrl + ,`) and pick a theme, I usually go with *"One Half Dark"*

## Oh-My-Posh
Just follow [Oh-My-Posh](https://ohmyposh.dev/) installation instructions.

Tip: some Windows 11 versions have a problem with fonts, it looks like they're lost every time
the computer restarts. To solve this simply install the font for all users (right click -> install for all users).

## PSReadLineModule
We want to install the PsReadLine module, activate it in the profile and change the keybinding.

To install the module simply run the following command (with administrator privileges):

```powershell
Install-Module PSReadLine -RequiredVersion 2.1.0
```

Then open your Powershell profile with your preferred text editor (i use helix),
you can find it under the variable `$PROFILE`. If there is no profile, just create one with 

```powershell
  New-Item -ItemType File $profile
```

Once you opened the profile, add the following lines:

```powershell
  Set-PSReadLineOption -PredictionSource History
  Set-PSReadLineKeyHandler -Key "Tab" -Function AcceptSuggestion
```

Those will activate the PsReadLine module and set the `AcceptSuggestion` keybinding to the `Tab` key. 

## Git aliases
We will use [git-aliases](https://github.com/gluons/powershell-git-aliases) module to obtain zsh-like git aliases
in powershell. Simply install the module:

```powershell
  Install-Module git-aliases -Scope CurrentUser -AllowClobber
```

and import the module in the powershell profile:

```powershell
  Import-Module git-aliases -DisableNameChecking
```


## zoxide
Just follow [zoxide](https://github.com/ajeetdsouza/zoxide)'s installation instructions
When setting up zoxide in the powershell profile, use this line to set the alias to `cd`: 

```powershell
  Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
```
