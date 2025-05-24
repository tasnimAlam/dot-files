# kdeconnect-send.yazi

Send selected files to your smartphone or other devices using KDE Connect. This plugin allows you to quickly share files from Yazi file manager directly to any KDE Connect-paired device.

## Features

- Select and send multiple files to KDE Connect devices
- Automatically detects available and reachable KDE Connect devices
- Automatically uses the only available device if there's just one
- Prompts for device selection when multiple devices are available
- Provides notifications for successful and failed transfers
- Warns when no files are selected

## Requirements

- KDE Connect installed on your system
- `kdeconnect-cli` command available in your PATH
- At least one device paired and reachable via KDE Connect

## Installation

### Using `ya pack`

```sh
ya pack -a Deepak22903/kdeconnect-send
```

### Using Git

Clone the repository directly into your Yazi plugins directory:

```sh
git clone https://github.com/Deepak22903/kdeconnect-send.yazi.git ~/.config/yazi/plugins/kdeconnect-send.yazi
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[manager.prepend_keymap]]
on   = [ "<C-s>" ]
run  = "plugin kdeconnect-send"
desc = "Send selected files via KDE Connect"
```

Make sure the <kbd>ctrl</kbd> => <kbd>s</kbd> key combination is not used elsewhere.

## How to Use

1. Select one or more files in Yazi using your selection key (typically <kbd>Space</kbd>)
2. Press <kbd>ctrl</kbd> followed by <kbd>s</kbd> to activate the plugin
3. If multiple devices are available, select the device ID you want to send to
4. The files will be sent and you'll receive a notification of the results

## License

This plugin is MIT-licensed.
