# dotFile

This repository is my personal configuration

# License

MIT License

## Initial macOS

## Personal software configuration

### ZSH

```
cp ~/.zshrc .zshrc.bk

cat ./zshrc.sh >> ~/.zshrc
```

### Sublime Text 3

Back up `cp ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ./`

Restore `cp ./Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/`


## The Last

Launch Dropbox, set it up then run `mackup restore`