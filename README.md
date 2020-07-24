# nps.sh
Bash script to download content from NoPayStation

It's still WIP. You can download stuff with it but it doesn't handle RAPs and zRIFs yet. I do realize how messy it is, it's my first script that's longer than 2 lines so PRs are welcome.

## Installation

First you have to install the dependencies:
  * curl
  * wget
  * fzf
  * [pkg2zip](https://github.com/lusid1/pkg2zip)

Clone the repo: `git clone https://github.com/bandithedoge/nps.sh.git`

Make sure you can actually execute the script: `chmod +x nps.sh/nps.sh`

## Usage

Go wherever you cloned the repo and run the script: `./nps.sh`

You'll be asked what you want to download. Type the 2-letter code and hit Enter. Start typing in the name or title ID of whatever you want to download, select the right thing and hit Enter. It will automatically start downloading and extracting.
It'll be downloaded to your current directory.

## TODO

- [ ] RAP and zRIF
- [ ] Option to use local TSV file
- [ ] Show more metadata like file size
