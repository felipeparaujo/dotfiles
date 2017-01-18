dotfiles
=========

Setup
-----

  1. Install zsh

  ```
   apt-get install zsh
  ```

  2. Clone this repository

  ```
    git clone https://github.com/felipeparaujo/dotfiles.git
  ```

  3. Run the setup script
  ```
    ./setup.sh
  ```
  4. Install the font


  6. Make `zsh` your default shell

  ```
    chsh -s /bin/zsh
  ```

Current Settings for iTerm2
---------------------------

  1. Font: 13pt SourceCodePro+Powerline+Awesome Regular
  
  2. Colors: Afterglow

BBC specific stuff
------------------

If using these dotfiles for non-BBC computers, delete the functions folder in ```.env/zsh/functions``` and edit the ```.zshrc``` to remove the source commands, at the beggining of the file.
