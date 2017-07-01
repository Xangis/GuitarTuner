# GuitarTuner

A simple MIDI-based guitar tuning note generator for Windows 7 and newer. It was 
originally released at http://zetacentauri.com and was downloaded more than
60,000 times before being open-sourced.

The goal with this application was to create the simplest guitar tuning note 
generator possible. It only supports standard tuning, but works with 6, 7, and 
8-string guitars.

![GuitarTuner Screenshot](https://github.com/Xangis/GuitarTuner/blob/master/images/GuitarTuner1.02.png)

A prebuilt Windows installer is in the installer directory here:

https://github.com/Xangis/GuitarTuner/blob/master/installer/GuitarTuner1.02Setup.exe

If you prefer the 6-string tuner UI, an installer for version 1.01 is also in the 
installer directory.

The source code is licensed under the MIT license. See the LICENSE file for details.

## Building

The only dependency Guitar Tuner has is the Windows SDK. It uses the Windows MIDI
system to generate its tuning notes. It should build without any changes if you
have that.

A Visual Studio solution is included as GuitarTuner.sln.

## Changelog

#### 1.02

- Added low F# and B strings to support 7-string and 8-string guitar standard tunings.
- Enabled close button.
- Added Visual Studio redistributable to installer so users won't have to hunt for it if
they don't have it yet.

#### 1.01

- Created Windows installer

#### 1.0

- Initial Release

## Development Status

I consider Guitar Tuner to be a finished application and am not actively developing it.
However, I do still maintain it and will likely update it if necessary as new versions
of Windows are released.
