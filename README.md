### <ins>What is this repository</ins> ?

This is the repository where a I save my personal configuration of neovim
I derived it from Nvchad for easier configuration 

Steps to use this config:
1. [Pre-requisites](#pre-requisites) 
2. [Download the config](#download-the-config)
3. [Set-up](#setup)

To customize it further consult the [Nvchad docs](https://nvchad.com/docs/)
and if you find any issues or you want to implement something niche, I recommend
the Nvchad discussions on their [github](https://github.com/NvChad/NvChad/discussions)

---

### <ins>Pre-requisites</ins>

#### Install [Nvchad](https://nvchad.com/docs/quickstart/install) and its prequisites


(Optional) For some LSPs you would need to have package managers to install the different dependencies

- golang installed (for gopls)
- npm 
- etc ... 
---

### <ins>Download the config</ins>

<details>
<summary><h3>Linux 🐧 / MacOS 🍎</h3></summary>


```bash
git clone https://github.com/Ethanol48/nvchad-config ~/.config/nvim && nvim
```

</details>

<details>
<summary><h3>Windows 🪟<h3></summary>


#### Command Prompt(CMD)
```
git clone https://github.com/Ethanol48/nvchad-config %USERPROFILE%\AppData\Local\nvim && nvim
```

#### PowerShell(pwsh)
```
git clone https://github.com/Ethanol48/nvchad-config $ENV:USERPROFILE\AppData\Local\nvim && nvim
```

If the path doesn't work try these paths respectively:

For CMD : %LOCALAPPDATA%\nvim
```
C:\Users\%USERNAME%\AppData\Local\nvim 
```

For PowerShell : $ENV:LocalAppData\nvim 
```
C:\Users\$ENV:USERNAME\AppData\Local\nvim 
```
</details>

---

### <ins>Set-up</ins>

After installing the config and launching nvim for the first time Lazy would have installed most of the dependencies but LSPs and parsers are not intalled yet.

If you would like to change the default LSPs consult the config at `lua/configs/mason.lua` and consult the official documentation for the name of the lsp [lsp-config](https://github.com/neovim/nvim-lspconfig) and [Mason](https://github.com/mason-org/mason.nvim)

And install the LSPs with Mason with the following command:

```
:MasonInstallAll
```

You may find some errors for missing dependencies, the errors are mainly self-explaining if you can't figure it out you may want to go to a Nvchad discussion in [github](https://github.com/NvChad/NvChad/discussions)

And you are all set to enjoy your neovim experience
