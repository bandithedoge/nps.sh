#!/usr/bin/env bash

echo "What would you like to download?

  [vg]  PSV Games
  [vd]  PSV DLCs
  [vt]  PSV Themes
  [vu]  PSV Updates
  [vD]  PSV Demos

  [3g]  PS3 Games
  [3d]  PS3 DLCs
  [3t]  PS3 Themes
  [3a]  PS3 Avatars
  [3D]  PS3 Demos

  [pg]  PSP Games
  [pd]  PSP DLCs
  [pt]  PSP Themes
  [pu]  PSP Updates

  [m]   Minis
  [x]   PSX Games"

read db
case $db in
  vg)
    file=PSV_GAMES
    ;;
  vd)
    file=PSV_DLCS
    ;;
  vt)
    file=PSV_THEMES
    ;;
  vu)
    file=PSV_UPDATES
    ;;
  vD)
    file=PSV_DEMOS
    ;;
  3g)
    file=PS3_GAMES
    ;;
  3d)
    file=PS3_DLCS
    ;;
  3t)
    file=PS3_THEMES
    ;;
  3a)
    file=PS3_AVATARS
    ;;
  3D)
    file=PS3_DEMOS
    ;;
  pg)
    file=PSP_GAMES
    ;;
  pd)
    file=PSP_DLCS
    ;;
  pt)
    file=PSP_THEMES
    ;;
  pu)
    file=PSP_UPDATES
    ;;
  m)
    file=PSM_GAMES
    ;;
  x)
    file=PSX_GAMES
    ;;
  *)
    exit 2
    ;;
esac

mkdir -p .nps_temp

curl -q https://nopaystation.com/tsv/$file.tsv > .nps_temp/$file.tsv

if [ $file == 'PSP_GAMES' ]
then
  title=$(awk 'BEGIN { FS = "[\t]+"} ; { print $1 " | " $2 " | " $3 " | " $4 }' .nps_temp/$file.tsv \
    | sed '1d' \
    | fzf \
    | awk '{ print $1 }')
  link=$(grep $title .nps_temp/$file.tsv | awk 'BEGIN { FS = "[\t]+"} ; { print $5 }')
else
  title=$(awk 'BEGIN { FS = "[\t]+"} ; { print $1 " | " $2 " | " $3 }' .nps_temp/$file.tsv \
    | sed '1d' \
    | fzf \
    | awk '{ print $1 }')
  link=$(grep $title .nps_temp/$file.tsv | awk 'BEGIN { FS = "[\t]+"} ; { print $4 }')
fi

wget -O .nps_temp/$title.pkg $link

pkg2zip -x .nps_temp/$title.pkg

rm -r .nps_temp
