# GoYubi

This is a small docker file together with a startup script that I 
hacked together to get my yubikey running on any developer's computer 
that is around. It does not take care of the Yubikey used, so you can 
use it for your own.

## Features

You can use this docker image for

* SSH authentication
* Decrypting GPG-encrypted messages
* Signing messages

Encrypting is also possible, of course, but you may need to import 
public keys first.

## Usage

### SSH authentication

Simply do `ssh user@server`. It will ask you for your Yubikey PIN and 
log in.

### Decrypting GPG-encrypted messages

Type `gpg -d`, paste your message, press `Ctrl-D`. It asks for your PIN
and displays your message.

### Signing messages

Type `gpg -e`, paste your message, press `Ctrl-D`. It asks for your PIN 
and displays the signature.